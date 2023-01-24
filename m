Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F79B679C44
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 15:44:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKKWP-0004lN-LW; Tue, 24 Jan 2023 09:43:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pKKWN-0004lA-Ez
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 09:43:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pKKWM-0005MZ-1d
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 09:43:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674571413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qUymzmlOsPWhRI1Ffzqx87Tp6u/hPPufO19Fg1PXdEU=;
 b=fhaOVtqDSOc8/ZliHBvtH+phjyIYFpQNdlK6rtg6dXTMD+OrogRizxJBWPeT2+25SiSGUn
 TY47PWMcTiSTFVWrAQ4+z5GIIp4wYCkCw6NVmkp2TlPNJhA/vQ+3WTWr9/LLpwDttifcby
 6v0rqQwSJKPnuhq7bbozXAyi4YztbVc=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-262-7UHLIYNCM2G7MkN61TCyHg-1; Tue, 24 Jan 2023 09:43:29 -0500
X-MC-Unique: 7UHLIYNCM2G7MkN61TCyHg-1
Received: by mail-ua1-f70.google.com with SMTP id
 n14-20020a9f314e000000b004114b0c125fso4362962uab.8
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 06:43:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qUymzmlOsPWhRI1Ffzqx87Tp6u/hPPufO19Fg1PXdEU=;
 b=DDjWsmPem1YfudPQIiAehesgrf9ZfU1hzMREKBPKEPLyHJwwVIMO8d6RueiM59knYl
 hPCAjQYtdjCvy3/gASUE7GYwoil3zYmA66qlnJo5MjjEZad3qqMrF+Oy0RsYRLoQlSN8
 cgc29cHNJhNIxNas7vWUcuWECkBewr/+R99mEmVdsMYw4QaVKTRku/jeqXhKGEK8nY4/
 IaiLwJVgcaVMDwjdixJVxc9rkfesu+ih+Fj+rgvglMWaz38XM0AySd9wkfhmuS6EGaIg
 Yw86GhnH3c77MK4bjRUPl2PiOjUeWbhJ1ow7QJMhiU9mKy9B6FGOnmocyOjZmG+6F0Pf
 7Mtg==
X-Gm-Message-State: AFqh2kqsZcylCIL6vF25DPpD+2H+0Yjvjs2P+e3+jKIOOa7lBO84/gL3
 JnhOgiitbG4LVrJqwcjFMF6TUgkeujz9icX1JcXzv5vLCVUJRbnkqLNEl4IJu//jw3BvYH+xiod
 /1TYEZYLMmC9lGF4=
X-Received: by 2002:a05:6102:14aa:b0:3d1:3b77:eccb with SMTP id
 d42-20020a05610214aa00b003d13b77eccbmr17887100vsv.32.1674571409031; 
 Tue, 24 Jan 2023 06:43:29 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtbo6cmAGnBLH9pxNM4wjrrI+Hu1vRW/qIA0boThVhz0WPpLDhuTK023kXbZCbtvjphGbnPag==
X-Received: by 2002:a05:6102:14aa:b0:3d1:3b77:eccb with SMTP id
 d42-20020a05610214aa00b003d13b77eccbmr17887086vsv.32.1674571408809; 
 Tue, 24 Jan 2023 06:43:28 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-179-158.web.vodafone.de.
 [109.43.179.158]) by smtp.gmail.com with ESMTPSA id
 x12-20020a05620a01ec00b0070eb5766a9fsm1475010qkn.10.2023.01.24.06.43.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jan 2023 06:43:28 -0800 (PST)
Message-ID: <0c771cc2-4746-0e5b-e372-c2a7be830144@redhat.com>
Date: Tue, 24 Jan 2023 15:43:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: MinGW and libfdt (was: Re: MSYS2 and libfdt)
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: Bin Meng <bin.meng@windriver.com>, Stefan Weil <sw@weilnetz.de>,
 QEMU Developers <qemu-devel@nongnu.org>, Cole Robinson <crobinso@redhat.com>
References: <c2246b1a-51b3-2843-5164-c424c571874f@redhat.com>
 <CAJ+F1C+EC-tgDOyX5e56utKdUz-DXMMtwrtVyKXT2Jj4r43OCA@mail.gmail.com>
 <839268cb-b65c-68d6-1294-47548ed383b1@redhat.com>
 <CAJ+F1CJteJ665MLSUhWg-p9=tH6B7w-m=pop+o9ktGffxCiZaA@mail.gmail.com>
 <Y860hPT+o15BGQYq@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <Y860hPT+o15BGQYq@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

On 23/01/2023 17.23, Daniel P. Berrangé wrote:
> On Fri, Jan 20, 2023 at 05:57:29PM +0400, Marc-André Lureau wrote:
...
>>>> On Thu, Jan 19, 2023 at 12:31 PM Thomas Huth <thuth@redhat.com> wrote:
>>>>>
>>>>>
>>>>>     Hi all,
>>>>>
>>>>> in some spare minutes, I started playing with a patch to try to remove the
>>>>> dtc submodule from the QEMU git repository - according to
>>>>> https://repology.org/project/dtc/versions our supported build platforms
>>>>> should now all provide the minimum required version.
...
> So in theory we can try to drop the submodule for dtc now

The dtc package is also still missing in the MinGW cross compiler suite in 
Fedora ... does anybody know what's the right way to request it there?

  Thomas


