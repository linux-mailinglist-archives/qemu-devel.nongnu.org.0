Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CDE426626
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 10:44:48 +0200 (CEST)
Received: from localhost ([::1]:38344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYlUk-000659-B0
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 04:44:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mYlSU-0004qR-5K
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 04:42:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mYlSQ-0002ZR-AS
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 04:42:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633682540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KjIkgICgToZH3RX17dX/jdAuudFyZm6I/Oy/NJz2qQk=;
 b=UDQaGTz/eHMKhyoIwm2YeU3vS3sUDUhLecsQxLusMFpMyqXrZzAVmpd/iAeuOn1FsT6cIg
 g6vBjYyIU1kXmRWpROaRU++qe6EmiOFCbVQqBLwbLoDsOMoqESYK9SlsGmoD6usWMy+QI0
 E4AEHYwFz3fTLyjH0H524pMblte/8Fg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-575-bNo4WfDvNAGkc4IqUtBnpw-1; Fri, 08 Oct 2021 04:42:07 -0400
X-MC-Unique: bNo4WfDvNAGkc4IqUtBnpw-1
Received: by mail-ed1-f70.google.com with SMTP id
 g28-20020a50d0dc000000b003dae69dfe3aso8512162edf.7
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 01:42:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KjIkgICgToZH3RX17dX/jdAuudFyZm6I/Oy/NJz2qQk=;
 b=Hai06KE+5oFrUK91MMFVJTWh70F4bVf4JZwscLF0IwapT6+2+2Tti+aq0YkhMIv14t
 t8vU4+5Ah3A2BSPN7j/Kf+Rn3cIkqkTH23KYOA86EMjAVEQ/mWV3S8m0T2xJ6emhMcaU
 Nvmo19/LHHn/Xmm+EF1el7uRW3A15z43mGT7HP6RvJ5rbUpXZ9H4sxmvPYqzTRRK/oyq
 O1SGr+pHDfhzloHNiLtCBiT/Yu1AEHKXXyptH5ffUbA+oN1En+qhzCv4ztJyX8nt3vcj
 L5eFPcov31BFkgquTo01JqSuFqUVX6eZ2PgNQuHal3COnnQXr9815LodX3wwZf+B6oPx
 NQGg==
X-Gm-Message-State: AOAM530rWlzVO2uJpvIWPmMI9M7pqK/f+Iv+gL/qMFBR+LAzSCS38Gr8
 It4/0oHaotDQ0wwfUyKbObgE3bA2iW3g1MSf3wcxhOQMI4gFaaGctDApYavAuiLg7OEF5loaEGj
 16g0w3zKUkHml9jE=
X-Received: by 2002:a17:906:9399:: with SMTP id
 l25mr2481889ejx.363.1633682526561; 
 Fri, 08 Oct 2021 01:42:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyilUh9gZDWxe1LeiztXFUE1t34dox8gHcRkP3VENfQtqLOR9ZIAEdsp7ET5UVN/VJMFI0lug==
X-Received: by 2002:a17:906:9399:: with SMTP id
 l25mr2481867ejx.363.1633682526335; 
 Fri, 08 Oct 2021 01:42:06 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r22sm668326ejd.109.2021.10.08.01.42.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Oct 2021 01:42:05 -0700 (PDT)
Message-ID: <0041af0a-d653-2d2a-8af2-8b95828a2125@redhat.com>
Date: Fri, 8 Oct 2021 10:42:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 23/24] configure: prepare for auto-generated option parsing
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20211007130630.632028-1-pbonzini@redhat.com>
 <20211007130829.632254-18-pbonzini@redhat.com>
 <a1bdcb8f-8f37-a375-465b-a1bd0cc47d30@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <a1bdcb8f-8f37-a375-465b-a1bd0cc47d30@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/10/21 18:53, Thomas Huth wrote:
>> +meson_options=
>> +meson_option_parse() {
>> +  meson_options="$meson_options $(_meson_option_parse "$@")"
>> +  if test $? -eq 1; then
>> +    echo "ERROR: unknown option $1"
>> +    echo "Try '$0 --help' for more information"
>> +    exit 1
>> +  fi
>> +}
> 
> Why the detour via this wrapper and $(_meson_option_parse) ? Couldn't 
> you simply add the stuff directly to $meson_options in 
> _meson_option_parse() ?

Mostly to keep the amount of shell-in-Python code as small as possible. 
  Also, I liked that the generated shell code was completely independent 
of the configure script, did not use global variables and did not have 
to know that "meson_options" is tied to the way the "run_meson" shell 
function uses eval.

>> +options = load_options(json.load(sys.stdin))
> 
> Could you maybe print a header line first, à la:
> 
> # This file is generated by meson-buildoptions.py, do not edit!

Yes, of course.

Paolo


