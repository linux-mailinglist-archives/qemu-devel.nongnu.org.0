Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FB72AF1B6
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 14:09:08 +0100 (CET)
Received: from localhost ([::1]:49088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcps3-0002GL-Ji
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 08:09:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kcpq7-0000bD-5t
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 08:07:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kcpq4-0000Ks-9F
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 08:07:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605100022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xll97eOB99iu9DTgq/BG6+Q3fZ1VcsrJQ+yWrOTupUU=;
 b=bS3MFvwXe8h3DEn66NTvaMK3ahBozTLXivwtFkofVAV8Mjt4e91/DihnbG22+Y/kMVW2/i
 DDaNqTqcN9T35Txk/Y/Ejgcz3hbbx2cnuX6HXCWqDdkHKD0yFWbr1TeYO5hJaIn6sUIzrZ
 zRgQOZ0Ojk+Xq4XgWWrcC/YJezxXGp8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-VVgcT2bpMIaBXqm5KdO8Fg-1; Wed, 11 Nov 2020 08:07:00 -0500
X-MC-Unique: VVgcT2bpMIaBXqm5KdO8Fg-1
Received: by mail-ed1-f69.google.com with SMTP id f20so817151edx.23
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 05:07:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xll97eOB99iu9DTgq/BG6+Q3fZ1VcsrJQ+yWrOTupUU=;
 b=LyUiQVfMrd4ZCAE6RSK551KpkLoj5yftfZJ9U1eyzBisPXQwUBSI6gxHN0StC9WYuu
 qWm20T1zcaE2/SDkVFLaUKzwmbRI8xMglyllq6M5Wp2HzsuX+3Sm+ZlZ74kJM8Oyiy4I
 kb+l0p00QoayeRpxLZlRkeY8Frbvi2RVcOZH+SsF6Nc/YAhogbjfFVpIDGiyQ6P4I7B0
 aUjUtR+sjEbwmPfg96FK68rsi8JWZyT/BEgNsZebBzdYmNBAde/fK/FLZnwonB4uTdOl
 gJt0HP5JDipu8A8C4PMuDginQMKZwC2LhBcStpFzUtLI5cjJ4k9QKdS3DRdlMHDB2azg
 iEAQ==
X-Gm-Message-State: AOAM5321bNKKsy/Hd6JSiwrmtiPRQsMUf6LWfMNIg5o9aCEKExvd1FFl
 ftTLHnQh7ZIUzNHBcwrU7qtoBVGUHi+RDgYr0o64ziTjCIda/4YycUlAtJU8KIM6q+BHNartnlV
 wjFEwjfFPNwcopLM=
X-Received: by 2002:aa7:d4c9:: with SMTP id t9mr4971542edr.313.1605100019264; 
 Wed, 11 Nov 2020 05:06:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyKEjwgAoKQsed0/bHZnlOQ2OtZADmatHZvrik7sm377L1+S39ocCJWDI5LNlAAFpPhWpBuUA==
X-Received: by 2002:aa7:d4c9:: with SMTP id t9mr4971516edr.313.1605100019076; 
 Wed, 11 Nov 2020 05:06:59 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id bg4sm849553ejb.24.2020.11.11.05.06.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2020 05:06:58 -0800 (PST)
To: Kevin Wolf <kwolf@redhat.com>
References: <20201111092423.GA3898@merkur.fritz.box>
 <20201111101407.GD906488@redhat.com> <20201111103550.GB3898@merkur.fritz.box>
 <30bdf162-5b29-6725-f5a5-fb5dcc85abee@redhat.com>
 <20201111125307.GC3898@merkur.fritz.box>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: Command line QAPIfication and -readconfig
Message-ID: <0471d35c-6fbc-c3e8-a2c3-b627a1ec2ece@redhat.com>
Date: Wed, 11 Nov 2020 14:06:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201111125307.GC3898@merkur.fritz.box>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: jsnow@redhat.com,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/20 13:53, Kevin Wolf wrote:
> QDicts are one step closer to the final result, but would also have to
> be processed separately as they need only half of the processing that
> command line options need. Eventually, qobject_input_visitor_new_str()
> is what we want to use to parse strings directly into QAPI objects, and
> QDicts are only an internal intermediate result there.

To be clearer, the processing would look like this:

- both qemu_config_parse and qemu_read_config_file call a static 
function qemu_config_foreach

- qemu_config_foreach builds a QDict and passes it to a callback

qemu_read_config_file receives a callback argument from vl.c, while 
qemu_config_parse uses a default callback that does qemu_opts_create and 
qemu_opts_absorb_qdict.

The callback in vl.c does this:

1) for a keyval-based non-mergeable option (e.g. -object) -> do 
qdict_crumple and store the QDict for later processing.

2) for a keyval-based mergeable option (e.g. -M) -> do qdict_crumple and 
merge with previous command-line options using a new function keyval_merge

3) for non-keyval options -> forward to the default callback used by 
qemu_config_parse.


Later on, keyval-based options are parsed into QAPI objects or QOM 
properties using qobject_input_visitor_new_keyval.

> So while it's even uglier, maybe what we should do with -readconfig is
> convert it back to strings and then run the result through the normal
> command line processing? This would get rid of the special cases.

That would be more or less doable but there are two problems: 1) the 
-readconfig code is used for blkdebug too, so you would need some kind 
of callback anyway 2) converting to strings is not entirely trivial due 
to e.g. different spelling between the "-boot" command line option and 
the "boot-opts" group.

> Both options are probably only hacks for the short term, so either way I
> think I'd still prefer deprecating -readconfig now, in favour of command
> line options as long as we don't have a QAPI based config file.

"Now" is a bit too late for 5.2.  I would like to deprecate "-set" for 
that matter too, but it's so obscure that I'm thinking of just dropping 
it in 6.0.

Paolo


