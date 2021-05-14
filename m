Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD403809A2
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 14:34:34 +0200 (CEST)
Received: from localhost ([::1]:50326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhX1V-0003Vj-K9
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 08:34:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhWwO-0005PK-RZ
 for qemu-devel@nongnu.org; Fri, 14 May 2021 08:29:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhWwN-0003i8-0S
 for qemu-devel@nongnu.org; Fri, 14 May 2021 08:29:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620995354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=18p2Zm6E8Fjq91MISsj+u8i3X0ff8a5OE+mtxc8xn84=;
 b=Gv5nYQOxstIJYvcok5tAh/BJAhntpcD91lqzTQSshJKP7usevqb8axFMwD9e9UvJw0B+GZ
 nytqAIoGEzECnR4ae40R/N79S5fhVZXhNaG8zClnxBQym2J3ucSVfjNJxqbyVG2bOQmibt
 9UQFanGi+TvkFKtQChwDTj6/uUTObjk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-vh6sCoBqPNOxVwAIOKsdxw-1; Fri, 14 May 2021 08:29:12 -0400
X-MC-Unique: vh6sCoBqPNOxVwAIOKsdxw-1
Received: by mail-ej1-f71.google.com with SMTP id
 x20-20020a1709061354b02903cff4894505so2959780ejb.14
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 05:29:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=18p2Zm6E8Fjq91MISsj+u8i3X0ff8a5OE+mtxc8xn84=;
 b=oT4nKScV5c3aytyF6oehE6PptYPsXTJvF8LOp0pzXLSFzMJBE/1+VJegoME5oFrJAP
 dYinCa4VKqz/iscItuewZOaU97iItZ+l0d8K29I5hiUoJe6Yh68k7g79mwugrKGd1OYC
 SSuA0JUtdcabUtAJpQ9TkglVRyCW7qNJfDVKQWNYfbbTj/mwe33NZsdtY7Ixhr4t4iTw
 k8XVG5MluuRgUBwzPH+4qi+WVfImMqPfzlp/4Z6w6Bazc10D4DK7r2sniJQ+xENSvqzx
 ruw5GVvOC8Ayk0ztj31JBkJOEhXdOg4eGbJpLtdAggKLpd7Mwbe8GlSf8iouFdpy2GRt
 Ypow==
X-Gm-Message-State: AOAM533X1LpX5hZFhjwgNNRqOzhau5UjpyXX7lePQcxefJdD0rfUxIW5
 IN5K926nTA45Sh5WgDNNX3IW1tUlbqaFVgdqnUMLW6li6aIGrSTHZTA2PqnjUnZX+LUS5dUA1T0
 Qxnvi2y8Fv44Z4Cc=
X-Received: by 2002:a17:906:a1c5:: with SMTP id
 bx5mr50161238ejb.166.1620995351642; 
 Fri, 14 May 2021 05:29:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyl/vCLb270vzzO4/HimNaApfl5Yw4MGuZAtLEJ/idrYhcOvRC4hSbx+B/rB0cyl4lxVn86uw==
X-Received: by 2002:a17:906:a1c5:: with SMTP id
 bx5mr50161219ejb.166.1620995351479; 
 Fri, 14 May 2021 05:29:11 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id j8sm4401107edq.67.2021.05.14.05.29.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 05:29:11 -0700 (PDT)
Subject: Re: [PATCH v2 12/12] configure: bump min required CLang to 6.0 /
 XCode 10.0
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210514120415.1368922-1-berrange@redhat.com>
 <20210514120415.1368922-13-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <df9e9f9a-a85d-e747-f911-d80a322ee163@redhat.com>
Date: Fri, 14 May 2021 14:29:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210514120415.1368922-13-berrange@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Willian Rampazzo <willianr@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/14/21 2:04 PM, Daniel P. Berrangé wrote:
> Several distros have been dropped since the last time we bumped the
> minimum required CLang version.
> 
> Per repology, currently shipping versions are:
> 
>              RHEL-8: 10.0.1
>       Debian Buster: 7.0.1
>  openSUSE Leap 15.2: 9.0.1
>    Ubuntu LTS 18.04: 6.0.0
>    Ubuntu LTS 20.04: 10.0.0
>          FreeBSD 12: 8.0.1
>           Fedora 33: 11.0.0
>           Fedora 34: 11.1.0
> 
> With this list Ubuntu LTS 18.04 is the constraint at 6.0.0
> 
> An LLVM version of 6.0.0 corresponds to macOS XCode version of 10.0
> which dates from Sept 2018.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  configure | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


