Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DBC652393
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 16:17:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7eLp-0002qW-UR; Tue, 20 Dec 2022 10:16:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7eLn-0002ov-Vg
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 10:16:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7eLl-0008Nb-Ud
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 10:16:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671549373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=id2G/nGlOncEL8NIp9kYtMfgTbStjaHKZOHPR2kEB+E=;
 b=PwxAUIQjaUydCG9rgchdjrZqYYJRyM9bN16xImUvUMPR/OZYYaBuAIaaPT9MZGYcXqIVkX
 w+fSuDdLc33F3L181UiNki2PNPeNn+WgcYIM9mXB1FW1BRog6xQzglTHuIOwvevQ5buYf/
 HsoFjlarMWf+o7Qh3ny/oMuduW1nYNY=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-221-gQNNY-XcOOax430bbcHTQw-1; Tue, 20 Dec 2022 10:16:11 -0500
X-MC-Unique: gQNNY-XcOOax430bbcHTQw-1
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-45dd4fb5580so191127b3.22
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 07:16:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=id2G/nGlOncEL8NIp9kYtMfgTbStjaHKZOHPR2kEB+E=;
 b=y6Wfgs12uNqafrqkgzgwX1jRLJs+Y47yxwpnI1C9/+zsHvEfeijSETpBMhLKVsSv9e
 EvV+jpwQXfgISb4kqcm3hmFbozyGZwUv7/lrHk5UWZ7Qn8q4/bSU23WpnTeJYSdZncIg
 dOQJN/qPyzwnVdWOP3WE7p5HpTU/vr9oBs6zPyS1zhQo5DUhIbZz2/DWnk82td3T+INw
 Psu11xtdiEG777C/eUCZqqXHkX1n3fZGTTBnm4cAtIlCLMDJll8JHWZkrtoYoIpLkXtI
 yKZq1erPTCeIysJmO2aWTTlyqVn4QKRgHO/MTKGnF7ze0IXjbp661TwFYRvtETTs7EAh
 77mw==
X-Gm-Message-State: AFqh2kqcl/g7aF7ejW+ahay3MuiiOEtaI1CrXGBiuszs1R2ZNrSkNfMd
 EoOgq4SwKtiWl/4eJi8wJSZFn2WBEmy4886iD/s/ZHzfEnAFWxeQQhbN8/AzEfqCFP4lKIOPqwy
 w8eT3yGvWAtjSOr0=
X-Received: by 2002:a05:6902:46:b0:72b:28be:4e48 with SMTP id
 m6-20020a056902004600b0072b28be4e48mr19559802ybh.11.1671549369704; 
 Tue, 20 Dec 2022 07:16:09 -0800 (PST)
X-Google-Smtp-Source: AMrXdXstYQy30E1QzYMM7I1Q8QdNkzZSXWQYhRvMbEAsujrUNvmOeXo6GB4+yBWvTVUJDkSUVME1Xw==
X-Received: by 2002:a05:6902:46:b0:72b:28be:4e48 with SMTP id
 m6-20020a056902004600b0072b28be4e48mr19559778ybh.11.1671549369338; 
 Tue, 20 Dec 2022 07:16:09 -0800 (PST)
Received: from redhat.com ([37.19.199.118]) by smtp.gmail.com with ESMTPSA id
 u12-20020a05620a454c00b006fb112f512csm9285571qkp.74.2022.12.20.07.16.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 07:16:05 -0800 (PST)
Date: Tue, 20 Dec 2022 10:15:40 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Marcel Holtmann <marcel@holtmann.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH 7/7] libvhost-user: Switch to unsigned int for inuse
 field in struct VuVirtq
Message-ID: <20221220101454-mutt-send-email-mst@kernel.org>
References: <20221219175337.377435-8-marcel@holtmann.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221219175337.377435-8-marcel@holtmann.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Dec 19, 2022 at 06:53:37PM +0100, Marcel Holtmann wrote:
> It seems there is no need to keep the inuse field signed and end up with
> compiler warnings for sign-compare.
> 
>   CC       libvhost-user.o
> libvhost-user.c: In function ‘vu_queue_pop’:
> libvhost-user.c:2763:19: error: comparison of integer expressions of different signedness: ‘int’ and ‘unsigned int’ [-Werror=sign-compare]
>  2763 |     if (vq->inuse >= vq->vring.num) {
>       |                   ^~
> libvhost-user.c: In function ‘vu_queue_rewind’:
> libvhost-user.c:2808:13: error: comparison of integer expressions of different signedness: ‘unsigned int’ and ‘int’ [-Werror=sign-compare]
>  2808 |     if (num > vq->inuse) {
>       |             ^
> 
> Instead of casting the comparision to unsigned int, just make the inuse
> field unsigned int in the fist place.
> 
> Signed-off-by: Marcel Holtmann <marcel@holtmann.org>


Is this a part of a patchset? No threading visible and I'd rather not
guess.

> ---
>  subprojects/libvhost-user/libvhost-user.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/subprojects/libvhost-user/libvhost-user.h b/subprojects/libvhost-user/libvhost-user.h
> index aea7ec5061d5..8cda9b8f577a 100644
> --- a/subprojects/libvhost-user/libvhost-user.h
> +++ b/subprojects/libvhost-user/libvhost-user.h
> @@ -343,7 +343,7 @@ typedef struct VuVirtq {
>      /* Notification enabled? */
>      bool notification;
>  
> -    int inuse;
> +    unsigned int inuse;
>  
>      vu_queue_handler_cb handler;
>  
> -- 
> 2.38.1
> 
> 
> 


