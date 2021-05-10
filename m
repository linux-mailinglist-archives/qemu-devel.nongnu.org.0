Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2233797BD
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 21:32:48 +0200 (CEST)
Received: from localhost ([::1]:52138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgBe3-0008Ck-3w
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 15:32:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgBWp-0007C9-QI
 for qemu-devel@nongnu.org; Mon, 10 May 2021 15:25:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgBWn-0005Nz-Tb
 for qemu-devel@nongnu.org; Mon, 10 May 2021 15:25:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620674717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0WCDje9DFHlv8dcFRVV3xFKG1OXLDVDAv2gsQaePZbY=;
 b=TGcgVWuofwqOmSR+HC/OE5FYpYtRmY5T9X/L7cxk2BBsBaCXDfNdDAjFnd04a7Lo/jfJtN
 v2V1+BalKGEr6e4P1EF13b1ULopqgTlGwPmuBwNxJTCiQXALN49SIHfiBNKu6eZSECMFBI
 jJ3FS0I18tfOPwIfP5ShVTWqJ6dChis=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-O7HG5W-7MiiDJwtPk7DxKA-1; Mon, 10 May 2021 15:25:15 -0400
X-MC-Unique: O7HG5W-7MiiDJwtPk7DxKA-1
Received: by mail-ed1-f71.google.com with SMTP id
 i19-20020a05640242d3b0290388cea34ed3so9569015edc.15
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 12:25:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0WCDje9DFHlv8dcFRVV3xFKG1OXLDVDAv2gsQaePZbY=;
 b=WF3q91g8VdQDbB6YvdZPa2GmaKN/wy/qpfXpMcOeQF0OrdG7uV2Nvc2W8YZMd2siEb
 gTE6qtpgDly9QUBgoA7otkSQOQWWAWxmtDTls6QzJ6nOWIpjOmQEPNdLxsWVToEECSob
 vovLeF788IJhB7Ry3pZsTWufMniBdXtoVEs+Xd1Ckm3o5mdp7DaVJT7eN76oh6V4bnhA
 iodr/8QyE/cmoBv4yEkwxETjz33nbGqoWCQb+F+aTyKgqjVuJahJvp78qhJMWCq9+0DC
 GTI20r2WR10gyx/NhAxeVndUpRzVYHQTK8TrtbLoGvSoj1ZYEWt3WN9VGig0XyCPGx+w
 WChw==
X-Gm-Message-State: AOAM5310SRhAIWxFBOFn6qeCnZ9ANtMIZjG/xrsB5HCTsaaCm/XEXM5Y
 5W7sl2pLXmfoBJK6OjP8p+SHtv/b9U1b7j7K0kY1V+wfgX2GFT57qeCfYEpdohXekqjOBX2TExc
 rrKMGdKhzny7kaxM1cDj6foYWRc4baoKUHLSM0R1/z/Vv7inKiC7h93S7ewyjGdPv
X-Received: by 2002:a50:fb02:: with SMTP id d2mr19978155edq.34.1620674713922; 
 Mon, 10 May 2021 12:25:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKEphK9aGp3AHAZOrrgbehXQ8P+qSV7FBXNTYhD13hEg4VKCTr800wfBGb/hDngP0wCtcqmQ==
X-Received: by 2002:a50:fb02:: with SMTP id d2mr19978146edq.34.1620674713761; 
 Mon, 10 May 2021 12:25:13 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id d24sm12274225edp.31.2021.05.10.12.25.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 May 2021 12:25:13 -0700 (PDT)
Subject: Re: [PATCH 0/7] vhost-user-gpu: fix several security issues
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Li Qiang <liq3ea@gmail.com>
References: <20210505045824.33880-1-liq3ea@163.com>
 <CAJ+F1CLym=c1hBXeC9-_bVR5RBKhS8fVwbianjnJAUBVz+_foQ@mail.gmail.com>
 <CAKXe6SLyzGUDG6Tex2QnCMk4CWbEWVZd66Q_=iBwDoqf5=R-Jw@mail.gmail.com>
 <CAJ+F1CKgZzKzCurGSyQ7s2ZOADgX7BbWgvDVV=ejgthdA3K+pQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <fc38a372-57ad-6c22-c4e8-cfe56ad35d05@redhat.com>
Date: Mon, 10 May 2021 21:25:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CKgZzKzCurGSyQ7s2ZOADgX7BbWgvDVV=ejgthdA3K+pQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Li Qiang <liq3ea@163.com>, Gerd Hoffmann <kraxel@redhat.com>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/5/21 11:35 AM, Marc-André Lureau wrote:
> Hi
> 
> On Wed, May 5, 2021 at 1:28 PM Li Qiang <liq3ea@gmail.com
> <mailto:liq3ea@gmail.com>> wrote:
> 
>     Marc-André Lureau <marcandre.lureau@gmail.com
>     <mailto:marcandre.lureau@gmail.com>> 于2021年5月5日周三 下午5:10写道：
>     >
>     > Hi
>     >
>     > On Wed, May 5, 2021 at 9:21 AM Li Qiang <liq3ea@163.com
>     <mailto:liq3ea@163.com>> wrote:
>     >>
>     >> These security issue is low severity and is similar with the
>     >> virtio-vga/virtio-gpu device. All of them can be triggered by
>     >> the guest user.
>     >>
>     >> Li Qiang (7):
>     >>   vhost-user-gpu: fix memory disclosure in virgl_cmd_get_capset_info
>     >>   vhost-user-gpu: fix resource leak in 'vg_resource_create_2d'
>     >>   vhost-user-gpu: fix memory leak in vg_resource_attach_backing
>     >>   vhost-user-gpu: fix memory link while calling 'vg_resource_unref'
>     >>   vhost-user-gpu: fix memory leak in 'virgl_cmd_resource_unref'
>     >>   vhost-user-gpu: fix memory leak in 'virgl_resource_attach_backing'
>     >>   vhost-user-gpu: fix OOB write in 'virgl_cmd_get_capset'
>     >>
>     >>  contrib/vhost-user-gpu/vhost-user-gpu.c |  7 +++++++
>     >>  contrib/vhost-user-gpu/virgl.c          | 17 ++++++++++++++++-
>     >>  2 files changed, 23 insertions(+), 1 deletion(-)
>     >>
>     >> --
>     >
>     >
>     > The whole series looks good to me, and applies fixes that were
>     done earlier in virtio-gpu.
> 
>     Do you mean you have merged this series?
>     Should I tweak something such as "adding the original fix in
>     virtio-gpu"/"better mapping iov cleanup"?

Yes, and please also mention the corresponding CVE (CVE-2021-3544,
CVE-2021-3545, CVE-2021-3546).

> 
> 
> No I didn't. I was waiting for the answers to Prasad questions, and
> eventually v2.
> 
> Then either Gerd or me can queue this imho.
>  
> -- 
> Marc-André Lureau


