Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 410293250DF
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 14:50:12 +0100 (CET)
Received: from localhost ([::1]:49494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFH1u-00014H-VO
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 08:50:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lFH0c-0000FN-G2
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 08:48:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lFH0a-0002Bv-Mi
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 08:48:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614260927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3+XOHzhctG0lBYbayjbPGG7Ezgdhsy4EPhIAL57S5/U=;
 b=L3dhrayiX+DpnsBK1jaiZz/03PQvQUcJW1yiemBIbGwTsSb60mjw456KRosnpRHDrBjzUx
 aXPp+bgS1nSsncmsjSIbu6b6waiiOnOehJZYhnFgfaqEh1d9eocdjNYTbYAqmw/vfFU5s5
 iKvZC7jGOLUoLrHny7eW34/JT5GPv4A=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-Bsgp9sKSNG-imuaTWDmFEQ-1; Thu, 25 Feb 2021 08:48:45 -0500
X-MC-Unique: Bsgp9sKSNG-imuaTWDmFEQ-1
Received: by mail-wm1-f71.google.com with SMTP id n6so724419wmd.4
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 05:48:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3+XOHzhctG0lBYbayjbPGG7Ezgdhsy4EPhIAL57S5/U=;
 b=KCS76lOwWdKhkvUwcqutuoxPSxkmOPbjNwwp0Y+AuHmjqzvsZUiH7sHw1kdaIWs4W0
 dqA1NAk1VEA2G65eDgTpI13QD1iTLM47DYu4IPTkqmDr78jn7jZIXDlI3O9kZtB3Ahiz
 niVnwGZWWbLfCqXKrEju49b8WmgGI48GQQtyeZ3xvHTyiXD6f8tpDMocMZw+iC1jeeFx
 Kjw6Nw5+oqfqIyp3EY1FgTQCQF+whZTZyZPI3Qd1QVHp14L3fSEk6RwYBwwu0D4uSzqf
 xM8SpfAqWz6Mq4jQKAFbSTar4QntjhKX4riHWourDZ9ynXw2cEY7NyKF5quw7Vf5EhPI
 VUKA==
X-Gm-Message-State: AOAM531Nnh3zcBpnIBSe6dbiS6Fu5YmVEUQ9f0B8HUJmw0InzkjZikyk
 1aO25EF7I/hgHGUfH5c+3RACqZWSyxAuGq2Bt1KhhzALRqFk+f8vkg7rOsxf1+9beYNNLfbRYme
 +xa1/TDHUEqM/Fb8fCID1ZegMlRLc4eFxo2DtruQeuhkncnWkIhrzDSw3ctV2trf/o0Y=
X-Received: by 2002:a5d:5904:: with SMTP id v4mr3633693wrd.261.1614260924037; 
 Thu, 25 Feb 2021 05:48:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw16UZTQuhwwDOQ9V4WmoHfopOwpIEoshWg1+QpqRlNVRdGU3gondsq4I8n60fjA+wjxssq0w==
X-Received: by 2002:a5d:5904:: with SMTP id v4mr3633677wrd.261.1614260923790; 
 Thu, 25 Feb 2021 05:48:43 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id z5sm9202136wrn.8.2021.02.25.05.48.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Feb 2021 05:48:43 -0800 (PST)
Subject: Re: [PATCH] hvf: Sign the code after installation
To: Akihiko Odaki <akihiko.odaki@gmail.com>
References: <419dbb9c-badd-25d8-1755-00978a592671@redhat.com>
 <20210225000614.46919-1-akihiko.odaki@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <2d7fa111-9970-b417-392c-4ddaef3cc4a8@redhat.com>
Date: Thu, 25 Feb 2021 14:48:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210225000614.46919-1-akihiko.odaki@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.435, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/02/21 01:06, Akihiko Odaki wrote:
> Before this change, the code signed during the build was installed
> directly.
> 
> However, the signature gets invalidated because meson modifies the code
> to fix dynamic library install names during the install process.
> 
> It also prevents meson to strip the code because the pre-signed file is
> not marked as an executable (although it is somehow able to perform the
> modification described above).
> 
> With this change, the unsigned code will be installed and modified by
> meson first, and a script signs it later.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>

Thanks very much!  As mentioned in the other message, I would prefer to 
have a single script so here is what I came up with.

#!/bin/sh -e
#
# Helper script for the build process to apply entitlements

copy=:
if [ "$1" = --install ]; then
   shift
   copy=false
   cd "$MESON_INSTALL_DESTDIR_PREFIX"
fi

SRC="$1"
DST="$2"
ENTITLEMENT="$3"

if $copy; then
   trap 'rm "$DST.tmp"' exit
   cp -af "$SRC" "$DST.tmp"
   SRC="$DST.tmp"
fi

codesign --entitlements "$ENTITLEMENT" --force -s - "$SRC"
mv -f "$SRC" "$DST"
trap '' exit


I'll include this in the next pull request, since I was able to test it 
with Cirrus CI.

Thanks,

Paolo


