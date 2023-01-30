Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F1D6804D5
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 05:18:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMLbX-0000eA-V0; Sun, 29 Jan 2023 23:17:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMLbT-0000cX-JT
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 23:17:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMLbS-0001jZ-4Y
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 23:17:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675052229;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=fXkQfuLkH/WiTY22z/SUfzhzVsf1vAY4tPskw2pv6tU=;
 b=V9EeN0CQzvXGz0EkigJhruBdcfsyzbOPj2U3aWwbQ5/ZEsIQ1yMp/tKCY/p+9i6S/Ct3d5
 72of3gg8P+rFdR452RXI6ocjaXaAccLySQ6zLfSTSodscDROVhY9aq/4rSSvqeqWqahzMq
 IDCHffOkS9Ar8pqR69o+fKiZBIYxJQY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-451-ho6OLsaRN_qflsN_7lECHQ-1; Sun, 29 Jan 2023 23:17:08 -0500
X-MC-Unique: ho6OLsaRN_qflsN_7lECHQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 l23-20020a7bc457000000b003db0cb8e543so3770401wmi.3
 for <qemu-devel@nongnu.org>; Sun, 29 Jan 2023 20:17:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fXkQfuLkH/WiTY22z/SUfzhzVsf1vAY4tPskw2pv6tU=;
 b=uFUPf/K/EtBE+XqsefmXTVprgkgHpdAmTvVcVFwpDueRlj6pnm1zT7uNPaVeQpVGPi
 XZcb45sk5yaW1fCQTOG+iEITONfGCPMwmW2IqTX8H9U2oq1gua1VCvN94+l1UFrn7XES
 Q6w7oRUSB4EzhTHeIDERdwnfscK93LP570jrS6ecHKZoykIpHuatYJBplKs2yv6NoCMO
 lSddIXd8XX1DOu3SZr4wAUbuzi7+/YTRP7+Vv+QSCm8Pc3euuGLRqzm/+KuZLjKN+wL/
 gxjyZb35XNa9ZplcEOsLabnLSg46EU48w3V9G7BXf2KhpG+YO0K3ivFGWKpCvcZ3/qo5
 C8lw==
X-Gm-Message-State: AO0yUKUzTohnEZvgXHtoBp8yrWgNfOyte5g4I0eftAme/ZDKe4fcAbCm
 nYfI4GYYXMnNTv2Xg8S2WkH5pLjtjYhEsQ/5pE/x5z7P2tQh/GZo3GBo4l6tyqGyRPUGfGwsOXN
 LAVuNE9RFVhnbtWU=
X-Received: by 2002:a05:600c:4928:b0:3dc:51ad:9dc4 with SMTP id
 f40-20020a05600c492800b003dc51ad9dc4mr4451625wmp.18.1675052227136; 
 Sun, 29 Jan 2023 20:17:07 -0800 (PST)
X-Google-Smtp-Source: AK7set+mRmU8WiKV3ZUt2rZLVl8LNsxFDoIl/mzEM6NXc0PVSnyu4LIh7xuDqqOzp+NHS9q3606V6Q==
X-Received: by 2002:a05:600c:4928:b0:3dc:51ad:9dc4 with SMTP id
 f40-20020a05600c492800b003dc51ad9dc4mr4451610wmp.18.1675052226924; 
 Sun, 29 Jan 2023 20:17:06 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 ip7-20020a05600ca68700b003dc433bb5e1sm7609336wmb.9.2023.01.29.20.17.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 20:17:06 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org,  richard.henderson@linaro.org,
 pbonzini@redhat.com,  dgilbert@redhat.com
Subject: Re: [PATCH 1/2] MAINTAINERS: Cover userfaultfd
In-Reply-To: <20230119091545.3116376-2-armbru@redhat.com> (Markus Armbruster's
 message of "Thu, 19 Jan 2023 10:15:44 +0100")
References: <20230119091545.3116376-1-armbru@redhat.com>
 <20230119091545.3116376-2-armbru@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 30 Jan 2023 05:17:05 +0100
Message-ID: <87y1pkodvi.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Markus Armbruster <armbru@redhat.com> wrote:
> Commit 0e9b5cd6b2 "migration: introduce UFFD-WP low-level interface
> helpers" added util/userfaultfd.c without covering it in MAINTAINERS.
> Add it to section "Migration".
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>


Reviewed-by: Juan Quintela <quintela@redhat.com>


