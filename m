Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8586744A7C1
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 08:43:17 +0100 (CET)
Received: from localhost ([::1]:39548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkLmm-00067W-Mn
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 02:43:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mkLhZ-0001FL-O4
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 02:37:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mkLhX-0002m4-JZ
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 02:37:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636443470;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PyTsZwRiZ8rHElNj5P48rvi9itbhDtnK/2NSJ7knY6c=;
 b=FZAC5/WdVghaHXR9XAB17OS94qS5NanuTbgmiqZxYc23WLBtbz1fvqdl+Le92W1J/uNjdt
 308rbpXaLypBX5A+ILuBPrys5DTlb5bwA8w6q3dX7ILisnJO2tBkPHYMKMPUhoXzNjhq2I
 vkUzREKVSE8+OH6pE75cZl9CGLeIrrY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-oyTRcSa7NPGjf0P-hDQJ9w-1; Tue, 09 Nov 2021 02:37:49 -0500
X-MC-Unique: oyTRcSa7NPGjf0P-hDQJ9w-1
Received: by mail-wm1-f72.google.com with SMTP id
 o18-20020a05600c511200b00332fa17a02eso751607wms.5
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 23:37:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PyTsZwRiZ8rHElNj5P48rvi9itbhDtnK/2NSJ7knY6c=;
 b=IQHGHLmU+ZVrVFeFuhWEFy0PAqchUIQn30ef5VcHOZUgSd9j1kVD5zLQhmQTvDalLL
 cwYaIljeEgwMU/g1NRCi8ssnkew7WRslTM+/hrKByBmGXrPo+ShIaL667BDYc7176Se5
 PIjJQIHVACdSQHf55/JXtL3t3Fy3qOJLVLfw/veALHCXWdgef7eAh6U8WQuKgzSP8Tmy
 OxS79M+kEmI8uAhEqeyX5HjYkG+9QPpWDJGdyICmc9Z65yIwidrb0cuM1LjEV7ocUaFE
 PdyjycPkhbrX+qtBnzovg8EZim0ntxZYFCuLy3cEk3jfWUjGTONDIxcIZ/C4EV9f3dDM
 RUdw==
X-Gm-Message-State: AOAM530Kk+fFx7xDghaBIJRJeaAjVdx2vorzf35nVyftYraB9TroWY63
 UjAJt1vixsemqOQUpvxpEKVOqpNvr9rHnoguYNLZyc7u7SJSG/Z9vaQ7bMJb75K8rQeZsZ5YqeL
 gPXxO39Lzn4UNI/Y=
X-Received: by 2002:a05:600c:a0b:: with SMTP id
 z11mr4979547wmp.147.1636443468459; 
 Mon, 08 Nov 2021 23:37:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwQFJOKP+9SFiLTvgPqOCN0U1qxQDanlw7WI5fAXifXb6Q6sRgB268K/kCvSb98tA9wC9hCeQ==
X-Received: by 2002:a05:600c:a0b:: with SMTP id
 z11mr4979526wmp.147.1636443468248; 
 Mon, 08 Nov 2021 23:37:48 -0800 (PST)
Received: from localhost ([178.139.230.94])
 by smtp.gmail.com with ESMTPSA id c17sm1761499wmk.23.2021.11.08.23.37.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 23:37:47 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH] docs: fix 'sample-pages' option tag
In-Reply-To: <d212ac87ad45dcdd5d3ed85c61fc1fab765aed7e.1636353909.git.huangy81@chinatelecom.cn>
 (huangy's message of "Mon, 8 Nov 2021 14:51:00 +0800")
References: <d212ac87ad45dcdd5d3ed85c61fc1fab765aed7e.1636353909.git.huangy81@chinatelecom.cn>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 09 Nov 2021 08:37:49 +0100
Message-ID: <87czn9g4oi.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Markus Armbruster <armbru@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>
>
> commit f78d4ed701 has fixed qemu tag, making 'sample-pages' option tag
> involved by accident, which introduced since 6.1 in commit 7afa08cd8fd.
> revert this line.
>
> Signed-off-by: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>

Reviewed-by: Juan Quintela <quintela@redhat.com>

Queued.

Thanks, Juan.


