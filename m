Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 764696F1D84
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 19:34:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psRyg-0004bh-SS; Fri, 28 Apr 2023 13:33:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psRyf-0004bY-9n
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 13:33:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psRyd-0000KF-SO
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 13:33:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682703227;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=a5j5Ml0VZ/QI5mtzrQks0K8OV5Ygh9FrNQUrfTa3NVk=;
 b=hLAa0xWaCNayaUdFOLUkTRtksBiM7yuDyUe7jZ2HKCMroY/tLAwanbeUnphVyucigXdWGk
 At2VSPAJBQVFzQuXe7vutknVzvasr3neAPugH03+87ckpYNeeFnX/T+VSZKb3W3PqaXO6L
 GC2kgiPgEvKtYiiODPd7fvdaSZ6j8T4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-QeauF6LuMHmqG5XxN54DmQ-1; Fri, 28 Apr 2023 13:33:45 -0400
X-MC-Unique: QeauF6LuMHmqG5XxN54DmQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f08901fed3so63452375e9.1
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 10:33:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682703224; x=1685295224;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a5j5Ml0VZ/QI5mtzrQks0K8OV5Ygh9FrNQUrfTa3NVk=;
 b=gOkFUh74lDu4LUzWGk0OGGt8AhZtsaOK7SoyfeUUaJy9JDluQQd4+Y87PPchPo2DST
 j9+D/WtnbaM+oHZCRJ8smos0/JZ+vEqUyedbry4jsChcjFi6aYrqoDYF59iW09MecQs5
 Pd455h/xGEusErYsN+5iM+jnQVJMq/sQrR+s088eWthjn1E+TGerXj7YWU4iiyh35mrR
 /NYWNOXK1IfRK46X05Ms78Y5nljO76ZS8BtuRtZbdXAjO7oCqlW6DJmsciezCezznHcs
 qMHiP7JCQrR/JqePwb7sjaHIgIuoqh1U0Hi/Lf4TAS5WPBt1DEs183//pyRPIkL/o7kT
 NIew==
X-Gm-Message-State: AC+VfDwzyAYbF++8PvFJ3XR/WIJy/Q2b/oIuTcQNW01rKd8sGqj/HT27
 Hhi4yLGHyK7iNE737bphiYMU/mKDgNXsUzMQi+rAt2vPHcCDBk1fQUe+TqVDJc/SEjPpb3lwLcR
 0NJj7RtYqd5WYsw8=
X-Received: by 2002:adf:db86:0:b0:2f4:a3ea:65d2 with SMTP id
 u6-20020adfdb86000000b002f4a3ea65d2mr4618640wri.57.1682703224494; 
 Fri, 28 Apr 2023 10:33:44 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5ei9PhSsNnAUQWwqzncWbioEHVklmsjIgw6Ut7b7JAxDUbKRhruW8fAea4HmyJDTHlgxuZew==
X-Received: by 2002:adf:db86:0:b0:2f4:a3ea:65d2 with SMTP id
 u6-20020adfdb86000000b002f4a3ea65d2mr4618625wri.57.1682703224161; 
 Fri, 28 Apr 2023 10:33:44 -0700 (PDT)
Received: from redhat.com (static-213-163-6-89.ipcom.comunitel.net.
 [89.6.163.213]) by smtp.gmail.com with ESMTPSA id
 o12-20020a5d474c000000b002f4c2ea66absm21647853wrs.85.2023.04.28.10.33.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 10:33:43 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Lukas Straub <lukasstraub2@web.de>
Cc: qemu-devel <qemu-devel@nongnu.org>,  Peter Xu <peterx@redhat.com>,
 Thomas Huth <thuth@redhat.com>,  Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 14/13] migration: Initialize and cleanup
 decompression in migration.c
In-Reply-To: <20230420095950.057fe69b@gecko.fritz.box> (Lukas Straub's message
 of "Thu, 20 Apr 2023 11:59:50 +0200")
References: <cover.1681983401.git.lukasstraub2@web.de>
 <20230420095950.057fe69b@gecko.fritz.box>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 28 Apr 2023 19:33:42 +0200
Message-ID: <87wn1v9aix.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Lukas Straub <lukasstraub2@web.de> wrote:
> This fixes compress with colo.
>
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>

Reviewed-by: Juan Quintela <quintela@redhat.com>

> ---
>
> Oops, this one slipped trough

As the saying goes, it happes in the best families.

Yeap, it is a literal translation of a Spanish saying O:-)


