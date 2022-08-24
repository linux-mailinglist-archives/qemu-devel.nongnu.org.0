Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF31659F17D
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 04:48:17 +0200 (CEST)
Received: from localhost ([::1]:60620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQgRE-0004tM-So
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 22:48:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQgPL-0001cw-Uf
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 22:46:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQgPK-0006Xb-1H
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 22:46:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661309177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lKyR4SVsaj7X1tzW57hzTLrc9Vh4X7DPqbKafFfLnJs=;
 b=cIX1c6cMKwLF8IYp44SfFm+V2T/u+n3EEB28/jRtUhlUL7HJ5pt6ij1+AjtgBfyEe6+ytm
 RJ1PGJwL8nQQZK8q3EsvxtfIpFw4BTild6+3ntPsAMnqFnO+ifpSEI8+Hu9brmwe1zOyjo
 VjnKtubdr+DcOMWOjNPDlLgYgvfxzKQ=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-426-mv0IjKkPPumBYuxKGnD-kA-1; Tue, 23 Aug 2022 22:46:16 -0400
X-MC-Unique: mv0IjKkPPumBYuxKGnD-kA-1
Received: by mail-pg1-f198.google.com with SMTP id
 a12-20020a65604c000000b0042a8c1cc701so3946860pgp.1
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 19:46:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=lKyR4SVsaj7X1tzW57hzTLrc9Vh4X7DPqbKafFfLnJs=;
 b=CkMGzk+bVjBUtovyPCqgWgd7WGSXGopy5p6sGzaMpuRh66H72JFFcvzRNUN9fqp4an
 F/znwegfW+JkUY5U0fZcESaiCjzzqL5PVus2i1+9L38QkP6+wgzP0ow841qFe8OyhVgh
 WuuUzNHdj8wpGqPv/4KcULk6hXfQd+PrluQdjAT+OEE4mTDugtu+Huzv2vVri/SDGfnh
 8Ys3jMd9RwDFJoga6g8L+LVtRz+cOPmecAFrrIlaijIHx8kzAAZ/bZGpGHq0DZG47K7R
 JZWpL9tU3Yz7hb+YK9DJ12npKrLJEeFvWnFvkWz6Ep075dyUuofE/Y1Dk8Am3en+jgni
 IdRA==
X-Gm-Message-State: ACgBeo2ddZAR/B4WuJpVevrJ7ZRrxcGAY/jIrb6DsNhV1tLuvFXBEhJc
 I0rnjdh8XWkHFxStf4JYz5oBWpduAja6PB4gKW7mOGM9mTTbafXj61WONJCrqddE8faeimk9jT/
 jOdxNUtH0qbXH7Jc=
X-Received: by 2002:a63:3cc:0:b0:41d:7ab5:ca2f with SMTP id
 195-20020a6303cc000000b0041d7ab5ca2fmr23229235pgd.559.1661309175305; 
 Tue, 23 Aug 2022 19:46:15 -0700 (PDT)
X-Google-Smtp-Source: AA6agR50qkoSxU0GY7mMwCK1VxqkkBauxzfV0I9H5diRTftyFQx6AGRWoQ78jtqE5xSGcYSMc1W/dA==
X-Received: by 2002:a63:3cc:0:b0:41d:7ab5:ca2f with SMTP id
 195-20020a6303cc000000b0041d7ab5ca2fmr23229217pgd.559.1661309175020; 
 Tue, 23 Aug 2022 19:46:15 -0700 (PDT)
Received: from [10.72.13.201] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 q67-20020a634346000000b004161e62a3a5sm10022965pga.78.2022.08.23.19.46.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 19:46:14 -0700 (PDT)
Message-ID: <57362274-b2fb-a47d-fea7-d3ebcfad967b@redhat.com>
Date: Wed, 24 Aug 2022 10:46:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH v2 13/24] docs: vhost-user: add VHOST_USER_RESET_VRING
 message
Content-Language: en-US
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 f4bug@amsat.org, wangyanan55@huawei.com, hengqi@linux.alibaba.com,
 xuanzhuo@linux.alibaba.com, Maxime Coquelin <maxime.coquelin@redhat.com>
References: <cover.1660611460.git.kangjie.xu@linux.alibaba.com>
 <1f8fb06ed59583a9b5aedac1d7c6fd5fd09257b6.1660611460.git.kangjie.xu@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <1f8fb06ed59583a9b5aedac1d7c6fd5fd09257b6.1660611460.git.kangjie.xu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/8/16 09:06, Kangjie Xu 写道:
> To support the reset operation for an individual virtqueue,
> we introduce a new message VHOST_USER_RESET_VRING. This
> message is submitted by the front-end to reset an individual
> virtqueue to initial states in the back-end. The reply is
> needed to ensure that the reset operation is complete.
>
> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>


Acked-by: Jason Wang <jasowang@redhat.com>


> ---
>   docs/interop/vhost-user.rst | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
> index 3f18ab424e..ce7991b9d3 100644
> --- a/docs/interop/vhost-user.rst
> +++ b/docs/interop/vhost-user.rst
> @@ -1422,6 +1422,16 @@ Front-end message types
>     query the back-end for its device status as defined in the Virtio
>     specification.
>   
> +``VHOST_USER_RESET_VRING``
> +  :id: 41
> +  :equivalent ioctl: N/A
> +  :request payload: vring state description
> +  :reply payload: ``u64``
> +
> +  When the feature ``VIRTIO_F_RING_RESET`` feature has been successfully
> +  negotiated, this message is submitted by the front-end to reset an
> +  individual virtqueue to initial states in the back-end. It will ask
> +  for a reply to ensure the virtqueue is successfully reset in the back-end.
>   
>   Back-end message types
>   ----------------------


