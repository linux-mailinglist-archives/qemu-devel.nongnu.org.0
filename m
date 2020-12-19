Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCAB2DEEA1
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 13:12:40 +0100 (CET)
Received: from localhost ([::1]:55514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqb6E-0007rZ-Vb
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 07:12:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kqb59-0007Lh-PE
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 07:11:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kqb57-0007GA-5b
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 07:11:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608379887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cjZQMUXaB136iXTUDslP3Iie0yn227Hf9htBZJ9rOfc=;
 b=JMJOGMa3BGLp+IgjPewbp4TU0kY069ju/08wmggShJrYIUt31gR1GK+DJGW2cPsq3ZW+45
 KtLOKGrAM1B7Mobr6+1EOmOgrDh7XwlFnCe9nB8AxnX9qOK4WxQUvgFysoqtrn+nhexn33
 v66bpo5CWSXra97SmV8sem5pYSlDtQQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-ESsCbgp2MkCL7BvhhmULQQ-1; Sat, 19 Dec 2020 07:11:24 -0500
X-MC-Unique: ESsCbgp2MkCL7BvhhmULQQ-1
Received: by mail-ed1-f71.google.com with SMTP id i15so2196853edx.9
 for <qemu-devel@nongnu.org>; Sat, 19 Dec 2020 04:11:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cjZQMUXaB136iXTUDslP3Iie0yn227Hf9htBZJ9rOfc=;
 b=omOD4vh1peTybXxOclwtTHb9yoCjEdUQC+8jbq0U62GNKKmJ9qtWUN4OA1FdnpmZ56
 anO49OowcFXMF3ww2BRJp/yLCOLIJ5071h0jT6udOW+rGTs8I/1J/nmyTlMmKbEAwd+A
 6ni7RfuN98OiXqA//umA4TFEKJWzzgOWhRtSD/CHe1xabvYa3KUHOBO/ltdfRa+SYtRC
 VolsNbx60n1DyCosxfzs8oItsU+lFQehRByOrKfmEEIT+vdNG6DnTprfIQvrA/rkkU3y
 udwOocUtj27dkmYVWa/S9etevkXxHpDAxAE9SegT5cDXOyK0Gv07TJQOBAQ84GtWf1dH
 sIAQ==
X-Gm-Message-State: AOAM531MF821Vwmr+ZR8+e1gEO//0RKg/llYNEqHLKV+IMKKrTU/P3if
 zkUthqYnjlr686Cm7sRO+BNd8AsE0hgVYV1uxHuspM/HU49sI/Uci9eCEg/d8Ogw9eATN7ZvFch
 YnAEIysHykiRYDtQ=
X-Received: by 2002:a17:906:4e52:: with SMTP id
 g18mr8349222ejw.385.1608379883485; 
 Sat, 19 Dec 2020 04:11:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwMTteBtcl1EV7zyjSnw4bDpKUQJupPdMvm12W4gGTtciQSd+iGCEhHfPrk9mbnWOHsuM42YA==
X-Received: by 2002:a17:906:4e52:: with SMTP id
 g18mr8349200ejw.385.1608379883225; 
 Sat, 19 Dec 2020 04:11:23 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p3sm6690733ejx.0.2020.12.19.04.11.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Dec 2020 04:11:21 -0800 (PST)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20201216013646.40799-1-gromero@linux.ibm.com>
 <87bleut3si.fsf@linaro.org>
 <16b08946-9f96-200e-231f-40e24bb21734@linux.ibm.com>
 <87y2hwqpd2.fsf@linaro.org> <9d350192-db21-82ea-1246-8f70e5c89b36@redhat.com>
 <87mtybqqa8.fsf@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] configure: Fail when specified cross compiler cannot be
 found
Message-ID: <59535271-62e3-ba10-ae42-0e8ecd84e71f@redhat.com>
Date: Sat, 19 Dec 2020 13:11:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <87mtybqqa8.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: gustavo.romero@protonmail.com, david@gibson.dropbear.id.au,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 Gustavo Romero <gromero@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/12/20 12:57, Alex Bennée wrote:
> 
> Paolo Bonzini <pbonzini@redhat.com> writes:
> 
>> On 17/12/20 18:56, Alex Bennée wrote:
>>> To be honest at the moment the information is a little hidden at the top
>>> of the output. It would be nice if we could teach meson to echo it in
>>> it's nice coloured output.
>>>
>>> Paolo,
>>>
>>> Any ideas for the cleanest way to do that?
>>
>> The code in configure is pretty small:
>>
>> (for i in $cross_cc_vars; do
>>     export $i
>> done
>> export target_list source_path use_containers
>> $source_path/tests/tcg/configure.sh)
>>
>> configure would place the cross-cc variables (which are really just
>> command line options) in a file, something like config-cross-cc.mak, and
>> the Meson translation of the above would be
>>
>> env = environment()
>> foreach k, v : keyval.load(meson.current_build_dir() /
>> 'config-cross-cc.mak')
>>     env.set(k, v)
>> endforeach
>> env.set('target_list', ','.join(target_dirs))
>> env.set('source_path', meson.source_root())
>> env.set('use_containers',
>>           'CROSS_CC_CONTAINERS' in config_host ? 'yes' : 'no')
>> message(run_command(files('tests/tcg/configure.sh'), env: env).stdout())
>>
>> For a bit more polish, one could make tests/tcg/configure.sh print the
>> result in keyval format, parse it back from meson as a dictionary with
>> keyval.load(), and pass the result to summary().
> 
> Don't we already have this in the form of tests/tcg/config-$TARGET.mak?
> Shouldn't we just injest that into meson after configure.sh has run?

Yes, that's also a possibility I guess!  We can also do both (use 
run_command, and then reread tests/tcg/config-$TARGET.mak).  Long term, 
I'd like to run tests/tcg/configure.sh separately for each target so 
that we can reuse it for pc-bios.

Paolo


