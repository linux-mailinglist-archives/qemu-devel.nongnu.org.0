Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A4169A8BC
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 10:58:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSxTu-0007sL-LU; Fri, 17 Feb 2023 04:56:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pSxTs-0007rv-Fr
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 04:56:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pSxTq-0007Lq-RK
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 04:56:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676627797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fGi7cWbHmiOulPJ2tTkT9NKwr+l1zYFkbNAa0THo0vw=;
 b=DW4MrX7i6Gni4lOOvAZcRgUkL1FGclqfqhJn7Fiask4hZXbunsPiSRE3A5YLxQpoY9sQ5H
 AouOAAMu+DP6JBXuL6otvxuiDWA7sfOZOgESaaquyI40Dr07baTxvq7IhR73Z2xTL0JJ3w
 BqVjs79rFIljEgMuU117GwWwIE144zQ=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-196-jiUnSoYSN0ebrbISGztsvA-1; Fri, 17 Feb 2023 04:56:36 -0500
X-MC-Unique: jiUnSoYSN0ebrbISGztsvA-1
Received: by mail-qk1-f197.google.com with SMTP id
 k5-20020a05620a0b8500b0072db6346c39so32033qkh.16
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 01:56:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fGi7cWbHmiOulPJ2tTkT9NKwr+l1zYFkbNAa0THo0vw=;
 b=T7SN6wBzyFhdsjgG0UQrrwZivJjYAD+M8RHgIlkIekWVqq9YFg6LFkQeQV5mPG4mJs
 E2ngEd+WxOSIOnbeG+jKBcqd52X8FjASJdXwHHS6yuh6Epk5PtR68xhJzH9HktJYCCyg
 kC0VdggG+PbdeMeT1VfmToT2yAScfz/Z0iq+b0x4wg7bUnQDGcHHGhXFL7SyLZvwTLJx
 GKd6EmpAaljvKRcnA4B73SBKZqoe3yzLZ1l4WuF5DVpUmGZlKePmdNrvOVfhgNAedGR+
 VfiC5XZUYatJ3f2pJVdcL4+MQSbU6WcGgM2Q3dHnnqoyr4xqSfo44NcayZ7wBt43yGy7
 VEsQ==
X-Gm-Message-State: AO0yUKVBsWqo0G5JFy4Ny8FNhGJbpSoKjEvgU4l/LB32ytIMb0n+Iabw
 kNltjryy1sN/HJym9Zh8Kk+cDeuNH82EfSflPURD/YAeDTrwJG8yqcKObMsaHL+jf6fECGsrI9w
 YG3dQgSETDjMxK/E=
X-Received: by 2002:ac8:58c4:0:b0:3b8:118d:ad86 with SMTP id
 u4-20020ac858c4000000b003b8118dad86mr809512qta.21.1676627795714; 
 Fri, 17 Feb 2023 01:56:35 -0800 (PST)
X-Google-Smtp-Source: AK7set+4HZ816qD4fF0txk7rnDL9EB2zqobpMnyKqIfZxdaw4AGX5/9LEG16G109OCtkRVRmXB5Jpg==
X-Received: by 2002:ac8:58c4:0:b0:3b8:118d:ad86 with SMTP id
 u4-20020ac858c4000000b003b8118dad86mr809487qta.21.1676627795456; 
 Fri, 17 Feb 2023 01:56:35 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-32.web.vodafone.de.
 [109.43.176.32]) by smtp.gmail.com with ESMTPSA id
 f17-20020ac80691000000b003b9b48cdbe8sm2950026qth.58.2023.02.17.01.56.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 01:56:34 -0800 (PST)
Message-ID: <331ac041-254e-8db8-33f3-23b36e6a431c@redhat.com>
Date: Fri, 17 Feb 2023 10:56:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Kevin Wolf <kwolf@redhat.com>
References: <20230210003147.1309376-1-jsnow@redhat.com>
 <87v8k2ycjb.fsf@pond.sub.org>
 <a2783906-cad2-2d47-5bbb-66d799b2a4b8@redhat.com>
 <87zg9cirti.fsf@pond.sub.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 0/7] Python: Drop support for Python 3.6
In-Reply-To: <87zg9cirti.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.351, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 17/02/2023 10.06, Markus Armbruster wrote:
> Thomas Huth <thuth@redhat.com> writes:
...
> My view on all this is a bit more pragmatic.
> 
> For a human developer, the difference between "dnf install
> python-sphinx" and "pip install sphinx" is, in my opinion, close to
> negligible.  Really no comparison to "git-clone GCC and bootstap it".
> You seem to disagree with that.

Honestly, being a Python ignorant, I completely messed up my system with 
"pip" already a couple of times, especially if the instructions forgot to 
tell me to use the "--user" switch. So yes, I tend to disagree ;-)

> For automated builds in general, and distro packaging in particular, the
> difference is real, and could even be a show stopper.  But who's
> packaging bleeding edge QEMU on CentOS 8?  I suspect the only automated
> builds are our own CI, where the difference is real, but hardly a show
> stopper.

If we've got the feeling that nobody out there really builds QEMU on older 
long-term distros anymore, then why the heck are we still trying to support 
this according to our support statement?

> But then I'd like us to be a bit more pragmatic.  Is minor and graceful
> degradation for systems close to the trailing edge really so
> unacceptably terrible that we have to bend over backwards to avoid it?

Let's just get our support statement adjusted - it was written with good 
intention originally, but apparently this is causing too much pain, so we 
should adjust it instead of suffering in upstream development.

>>> All the angst about CentOS falling off the end of our "supported build
>>> platforms" list is not actually warranted by this series :)
>>
>> Using the term "angst" for the concerns of your fellows here is quite
>> cheeky. It's not about "angst", it's about a discussion that our support
>> policy might need to be adjusted if we do this step. So instead of writing
>> such sentences, I'd rather would like to see you posting a patch for
>> docs/about/build-platforms.rst for constructive further discussion instead.
> 
> The phrasing of this sentence was ill-advised.  If it caused offense, I
> apologize.

Ok, thanks. And just to make it clear again: I certainly do not object 
dropping the support for Python 3.6 - I just want to make sure that we 
adjust our support statement if the current version is causing too much pain 
for us. Sorry if I got that across in the wrong way.

  Thomas


