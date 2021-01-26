Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C5D3048E9
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 20:42:51 +0100 (CET)
Received: from localhost ([::1]:56974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4UEk-0004ZS-O2
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 14:42:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4UAV-0001D3-JX
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 14:38:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4UAR-0005pu-0I
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 14:38:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611689901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F75fA5zf+a5JptAFrGdn52X/Qa4Ybj7o37U8MaChtWw=;
 b=cP2bELievJ5u+43GWf04thBi+xQkNXML1VxZKB3V0kUjHlewtBUGZbtZcrkNBK/90lfxZS
 zMF5CkNAeKGzQl3st89bePNNT8bRA5rbdsD8CwKgMsNJqRpZ60p1vvER9tJW2s3uNd3uDU
 IlanmdK2b+qv7Mmk5tQKsw4KnZsimz0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-cNkVRJ_ZOs2o3cXN-azZgg-1; Tue, 26 Jan 2021 14:38:18 -0500
X-MC-Unique: cNkVRJ_ZOs2o3cXN-azZgg-1
Received: by mail-ed1-f71.google.com with SMTP id a26so9957429edx.8
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 11:38:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=F75fA5zf+a5JptAFrGdn52X/Qa4Ybj7o37U8MaChtWw=;
 b=bRMfGnIvSWX59qpLWi61NS7XWDesVdpkEqLD7MFG/o09GVEHaxGMpIUwB1WJxKMIpz
 h03QJaJWT6vBoOvey5CFYogzgEcny27gsO7T5q0fCJSNlcMahglSETu2zfW9BWpY9Wz3
 5BUFnwR4Rsb4h155aUuZ7TNKNlXGzI93HanfdghFMpxzFhQUz6j7k42RKmokltnppuVJ
 5rXi9Jp43UZ8RUI7gJKVWnTAXJpEo0/xUwF+eTV5jsAwt69EJaIDAlpkn+gT9bKuFJRJ
 D+pfdJqTv2XtjWa16C6mIgdxso8VyNVEvi83hX+tviCnh5u+UjnZz+B9OoBu50hZvfTz
 oyKg==
X-Gm-Message-State: AOAM5303XPMBllIKvy5NywMu6uA2atPYLddIcASDgOXjgRnLD4zafra9
 +a2KTVXz5D27M2NGjmTI0obJv3wI8s/6HfDt7DMPy+z9JwAOl1zGt7z/xA/qH9oTJqnoVFLeDls
 Hqd5JpMq1bFZJSZE=
X-Received: by 2002:a05:6402:c87:: with SMTP id
 cm7mr5900004edb.69.1611689897103; 
 Tue, 26 Jan 2021 11:38:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwiRJvYQ6lxOitBc261Dq4JKTJ1JjI1oc2xW+Ua249LFiCG0zvycF0upvfVdgEPQXrUX5WgyQ==
X-Received: by 2002:a05:6402:c87:: with SMTP id
 cm7mr5899989edb.69.1611689896933; 
 Tue, 26 Jan 2021 11:38:16 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id u9sm2131835edv.32.2021.01.26.11.38.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jan 2021 11:38:16 -0800 (PST)
Subject: Re: [PATCH v2 00/12] buildsys: Do not build various objects if not
 necessary
To: Markus Armbruster <armbru@redhat.com>
References: <20210122204441.2145197-1-philmd@redhat.com>
 <87eei7ycbu.fsf@linaro.org> <33307716-5ef8-ba62-428b-c136ec0f19db@redhat.com>
 <87sg6n1xyz.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1da8f947-adda-312c-b0d4-a81f362b0447@redhat.com>
Date: Tue, 26 Jan 2021 20:38:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <87sg6n1xyz.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 qemu-devel@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/26/21 5:09 PM, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> 
>> On 1/26/21 3:57 PM, Alex Bennée wrote:
>>>
>>> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
>>>
>>>> In this series we deselect a bunch of features when they
>>>> not required, so less objects are built.
>>>>
>>>> While this reduce pressure on CI and slow systems, this is
>>>> particularly helpful for developers regularly testing multiple
>>>> build configurations.
>>>>
>>>> All CI tests pass:
>>>> https://gitlab.com/philmd/qemu/-/pipelines/245654160
>>>>
>>>> Supersedes: <20210120151916.1167448-1-philmd@redhat.com>
>>>
>>> Series looks good to me but I guess you need some sub-system feedback.
>>
>> Yeah, I will wait for Markus feedback on qapi/ before respining (with
>> target/ fix), ...
> 
> Maybe I'm naive today, but to me this looks like a case of "if it still
> builds, it's fine".
> 
> Anything in particular you want my feedback for?

You are listed as qapi/ maintainer with Michael :)

QAPI
M: Markus Armbruster <armbru@redhat.com>
M: Michael Roth <michael.roth@amd.com>
S: Supported
F: qapi/

If it is fine to you, then I'll respin addressing Paolo's comments.

Thanks :)

Phil.


