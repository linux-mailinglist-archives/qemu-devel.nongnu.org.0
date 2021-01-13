Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 553C22F4D59
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 15:40:23 +0100 (CET)
Received: from localhost ([::1]:44678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzhJu-00062z-CT
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 09:40:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kzhFF-0000t8-16
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 09:35:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kzhEz-0007Qb-It
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 09:35:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610548516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kJv3L1eoLOIE2Fkd5n9yOuOpE3YyJz9fd+HCFh5VBsE=;
 b=Jg/i29NK01S/tTbms+CEN29Vs04VHcD4gizkOwwk+smMoErSsiKK2q9K6HkWdMq0V5CSsL
 hk1tYod4mhG2sHfGDrAqzv2/TnA0+AClLGDskh5Smfnf19YWTblzKa8/q05efzmV2NV9p4
 OmwMohAe2ud+LBzd+/Vk+aeS0YOHVXg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-117-bK9BpoAcPS6tb5yzg4lTRw-1; Wed, 13 Jan 2021 09:35:13 -0500
X-MC-Unique: bK9BpoAcPS6tb5yzg4lTRw-1
Received: by mail-ed1-f72.google.com with SMTP id a9so950269edy.8
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 06:35:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kJv3L1eoLOIE2Fkd5n9yOuOpE3YyJz9fd+HCFh5VBsE=;
 b=T03pR8ct8d6K5/SgrEgyAUm86ZWfBFvr62P5qjcf6P3H1qyIeybTSZZDC6lniEskXp
 PtIes9g9M+uQtoAqsAq2zM3+6NQHa4JF08ZhAEycQT5T1cxecVQ8wbeQHBFzRhMFKrtP
 YcL7CWEcJ8/1p3fefUPFw2UglThZNbYPqJKk+zmSHudpahoOjqV3dX6U+SpYAEnsolil
 cHd7a7Qk/k10lCQ0jRmfcLlHocw7+dE1qa6xGE21oJ/CG8Yqm9hqRJtT7A3B+PUOAgsA
 +iBOXr+FxjKnND4IXinWJ74TPQ0SKdmyXuht4pma3eIXyhjTvKE9zXbFQnfTBR7uAlk4
 92pg==
X-Gm-Message-State: AOAM531amGo1Sktwekie70LfsnWYev3Ra31mdVgKmOa23bnpo+bR28Kb
 yQFS1aUxzZ6fNg5aFyz5lrdT0q7x1aXlpc2G44H9GLfHBXGsa0eAF1//67NJkSXpemfVkuHqnyU
 5L3fBNS6itijo438=
X-Received: by 2002:aa7:c94a:: with SMTP id h10mr2005761edt.247.1610548511828; 
 Wed, 13 Jan 2021 06:35:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwqWqSJfbZRNCRiKrjgaYk4Xgh5C28ZAwpFs3Q+g12D2BDJ95qfSBDCppSI1uD5m68r9vJB4w==
X-Received: by 2002:aa7:c94a:: with SMTP id h10mr2005748edt.247.1610548511674; 
 Wed, 13 Jan 2021 06:35:11 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id da9sm907799edb.84.2021.01.13.06.35.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jan 2021 06:35:10 -0800 (PST)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <a2f5077b-ae74-2b39-4fb8-70d29dd549eb@redhat.com>
 <a56f2df6-867e-2542-734c-95c1ae3acf88@redhat.com>
 <6a08e9f5-7cd7-c2c8-4b61-5466a4ffb2ec@redhat.com>
 <20210113100956.xuyvmxayh5xytja3@sirius.home.kraxel.org>
 <f6157834-98d7-a49b-9cf9-87c2b15c2a81@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: minimal "zero conf" build dockerfiles for fedora:latest and
 alpine:latest
Message-ID: <72d273d6-01ce-493e-d174-622441dae162@redhat.com>
Date: Wed, 13 Jan 2021 15:35:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <f6157834-98d7-a49b-9cf9-87c2b15c2a81@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/01/21 11:29, Philippe Mathieu-Daudé wrote:
> On 1/13/21 11:09 AM, Gerd Hoffmann wrote:
>>    Hi,
>>
>>> I don't like Perl really, but there's a chicken-and-egg problem between
>>> detecting Python and using it to print the configure help script.  For
>>> configure-time tasks, Perl has the advantage that "#! /usr/bin/env perl"
>>> just works.
>>
>> Assuming perl is actually installed, the world seems to shift to python.
>> On a minimal fedora install python is present but perl is not ...
>>
>> On the other hand git depends on perl, so it is probably pretty hard to
>> find a developer workstation without perl installed, so maybe that
>> doesn't matter much for the time being.
> 
> There is also the new configure-parse-buildoptions.pl script Paolo
> wants to add:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg770651.html
> 

Yes, that's what I was referring to.  shaderinclude.pl could be 
converted easily to Python, and I do support in general moving from Perl 
to Python.  For configure-parse-buildoptions.pl I viewed Perl as more of 
a necessary evil.

In the case of scripts/tap-driver.pl, the plan is to use "meson test" 
instead as soon as it becomes featureful enough.  I have already 
switched my private branch to it, the upstream meson work is tracked at 
https://github.com/mesonbuild/meson/issues/7830.

Paolo


