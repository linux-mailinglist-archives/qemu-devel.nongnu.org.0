Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FCC2D34DF
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 22:11:54 +0100 (CET)
Received: from localhost ([::1]:42762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmkH3-0005dd-Ih
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 16:11:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kmj89-0004Hw-BN
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:58:37 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:43317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kmj87-000419-TF
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:58:37 -0500
Received: by mail-ej1-x644.google.com with SMTP id jx16so26355506ejb.10
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 11:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=j6BoINlZ6i4zBzmYLYLGQr6IWGclg4XuS4HMcIfdFIE=;
 b=jx+vNUXqVw49zjkcwp33N3vyP0RyD117qWhMV64gt4DC22kvSgWEvzm0i3m3pIY03u
 MJ9BFHUlKP8Au4Ckw9scD/Kshs19J9pCxyQtj3Z7RHYVMtcCmo6wr8WI95IynkJ38iEw
 MZNSOmkLfNrZKdzX8hTrmhd46i2p9vBaqq56xIg2JSBjELjGP36S8bIuEuNofUPm9dk/
 MQDOiAo6HZTJ2EzPA6DUY6s1Kc0FpOGS7UUvKBl0qjQgarT8OcGbBWbYDTk1gPMGLkJ4
 l3ujiYDjb2AAvIZVG9uR+pwVQr3E9fw8+4Jse4cen1BPNlChEqMtaUUVf/k2W4HUKpcq
 v1RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j6BoINlZ6i4zBzmYLYLGQr6IWGclg4XuS4HMcIfdFIE=;
 b=BITTP2B7H4rCbloYN2neo8c9MET0rUWLcDFRZ0Yv47ejp7f25JUnJt/zdRrBsdNA8o
 puB0+KAhz8m1FNIqUszcG4fMJEAnKLx4G24qCQpSIld/2hTDuNjNA2Xy8FBI8hqbY7FJ
 X6boF/5yyKh7FAL4YVfabFbdipoFVIg6782ybU5boDjzAGvoLchTHFbLO8fQlTXhUvQs
 yQm2HDa7RMWHXKgfkBwZeszFIH+GOw38b5nXIqYuxXiK+iOkrp7DykR9yR/oMMe4BBqL
 6Fmm3TeGBdBmeTfE+Hp9Whr18a3Jc8nuu9HdRtIXyEuegdNzywoOoCfx9FkpvWhydEhG
 AwBw==
X-Gm-Message-State: AOAM531KhSf1BVo5AQhm4ic+zNlpMWF7xjuphCo55aN/61KBve7yZYV6
 djHwFD4bxc5kUhAYo4q//ylSYNnybPQ=
X-Google-Smtp-Source: ABdhPJzn3RzkL7/kjqhwt3rgEkwOtwaNnXCTTsococEnU/z5fiGMYFCKtp5lMyKPYX4TejniOWFMNg==
X-Received: by 2002:a17:906:1b46:: with SMTP id
 p6mr25078312ejg.68.1607457513866; 
 Tue, 08 Dec 2020 11:58:33 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id s1sm7393634ejx.25.2020.12.08.11.58.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 11:58:32 -0800 (PST)
Subject: Re: [PATCH 3/4] qmp: Allow setting -action parameters on the fly
From: Paolo Bonzini <pbonzini@redhat.com>
To: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>, qemu-devel@nongnu.org
References: <1607454890-3339-1-git-send-email-alejandro.j.jimenez@oracle.com>
 <1607454890-3339-4-git-send-email-alejandro.j.jimenez@oracle.com>
 <98a0e686-5e3c-b9c3-6885-04cdaa54df60@redhat.com>
Message-ID: <1aeb78a5-4ddc-348a-505a-6e9a20d1331d@redhat.com>
Date: Tue, 8 Dec 2020 20:58:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <98a0e686-5e3c-b9c3-6885-04cdaa54df60@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x644.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 08/12/20 20:57, Paolo Bonzini wrote:
> On 08/12/20 20:14, Alejandro Jimenez wrote:
>>   ##
>> +# @reboot-set-action:
>> +#
>> +# Set reboot action
>> +#
>> +# Since: 6.0
>> +##
>> +{ 'command': 'reboot-set-action', 'data' : {'action': 'RebootAction'} }
>> +
>> +##
>> +# @shutdown-set-action:
>> +#
>> +# Set shutdown action
>> +#
>> +# Since: 6.0
>> +##
>> +{ 'command': 'shutdown-set-action', 'data' : {'action': 
>> 'ShutdownAction'} }
>> +
>> +##
>> +# @panic-set-action:
>> +#
>> +# Set panic action
>> +#
>> +# Since: 6.0
>> +##
>> +{ 'command': 'panic-set-action', 'data' : {'action': 'PanicAction'} }
>> +
>> +##
> 
> What about a single action-set command with arguments reboot, shutdown 
> and panic?

(and watchdog, of course)?

Paolo

