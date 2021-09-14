Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6DB40B5CE
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 19:21:35 +0200 (CEST)
Received: from localhost ([::1]:56336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQC7j-0008Ly-0M
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 13:21:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQC1x-000893-NX
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 13:15:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQC1u-0000Ud-Ki
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 13:15:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631639734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jJ9xWZMiWsz/BwXwvXZIrZr6DPdm4UKto1ksF+WrM54=;
 b=YRjkoSY3LNboPQwwcuvPPmgESPQGT3RgdHjZ8iL7/ZC8qYg24VtMTGhfAQFM/j5iFQkDxb
 D8XULY5SmVKgMcTjiAj4RquXmPBpIpW+tWlkyn6SytYTu3BHoo4iSThQ5jHwzmgjQPzKPC
 B+Nx6rrYBN/e5joYy3C3QDqWhKweNKo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-sj3ywjIXOR-DDlffkDm-ag-1; Tue, 14 Sep 2021 13:15:32 -0400
X-MC-Unique: sj3ywjIXOR-DDlffkDm-ag-1
Received: by mail-wr1-f69.google.com with SMTP id
 i16-20020adfded0000000b001572ebd528eso4209356wrn.19
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 10:15:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jJ9xWZMiWsz/BwXwvXZIrZr6DPdm4UKto1ksF+WrM54=;
 b=2MR8+OnGYH+VcFyP4w7FImW6jrYEsv6moJm8DmwnQqNZLTjBuSwQwHwmWqyRvrW6Og
 we3+EzzCOs3PVDKz+lJl3e2mFNsKL6gwhrCwZSUoGsM3aVxurQnPqdW8AOuA6rgE646S
 dufadfeG/+WaWqhjKgbXwiN14F/RBUtk5CRS8/BVYu82saxhh1tHPb/jcCHe8j1bTvL/
 GGqn8RumBzXRvBVm5jnekDqPX4jZ/t1pIffpeetGDthypyjgZnxAwi+hpU8Wj349O1fq
 lmm45pX+hU6mhTDFQJAAgsnlMo2OAny3PzzeQQX2DXfXjNSJKA5PqLOqXUNBVRs7/pwE
 8BdA==
X-Gm-Message-State: AOAM531YkR3Y0chw4o+qMDJnYXk8M8SF6lxLeABySuRG2aXqjUEnNmF4
 0Xqm90IVojG6L5S7ZXsQedTVTzafXazcJ6YgIGIH7TQ7KCZq9z8xtag1Qo/l7aUaO3VHTp8oL4W
 13omY5769QKe3UCc=
X-Received: by 2002:adf:fe0e:: with SMTP id n14mr291531wrr.236.1631639731650; 
 Tue, 14 Sep 2021 10:15:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/Kr/8qQoTmiiiNbyu3jw0TeHX3VQKL48jKzR/XffTD8L8JRg9QzQSCWnqkZnqUzkH+CYqRQ==
X-Received: by 2002:adf:fe0e:: with SMTP id n14mr291478wrr.236.1631639731319; 
 Tue, 14 Sep 2021 10:15:31 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id j27sm1554808wms.6.2021.09.14.10.15.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 10:15:30 -0700 (PDT)
Subject: Re: [PATCH v2 29/53] qapi: introduce x-query-registers QMP command
To: Eric Blake <eblake@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20210914142042.1655100-1-berrange@redhat.com>
 <20210914142042.1655100-30-berrange@redhat.com>
 <20210914160416.tmk5nuhch2yhfb27@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <da6637f1-413c-73a3-686d-0e8913c46da9@redhat.com>
Date: Tue, 14 Sep 2021 19:15:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210914160416.tmk5nuhch2yhfb27@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-ppc@nongnu.org,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/14/21 6:04 PM, Eric Blake wrote:
> On Tue, Sep 14, 2021 at 03:20:18PM +0100, Daniel P. Berrangé wrote:
>> This is a counterpart to the HMP "info registers" command. It is being
>> added with an "x-" prefix because this QMP command is intended as an
>> ad hoc debugging tool and will thus not be modelled in QAPI as fully
>> structured data, nor will it have long term guaranteed stability.
>> The existing HMP command is rewritten to call the QMP command.
>>
>> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
>> ---

>> +##
>> +# @HumanReadableText:
>> +#
>> +# @human-readable-text: Formatted output intended for humans.
>> +#
>> +# Since: 6.2.0
> 
> Should be '6.2', not '6.2.0', to match...
> 
>> +#
>> +##
>> +{ 'struct': 'HumanReadableText',
>> +  'data': { 'human-readable-text': 'str' } }
>> diff --git a/qapi/machine.json b/qapi/machine.json
>> index 157712f006..8737efa865 100644
>> --- a/qapi/machine.json
>> +++ b/qapi/machine.json
>> @@ -1312,3 +1312,18 @@
>>       '*cores': 'int',
>>       '*threads': 'int',
>>       '*maxcpus': 'int' } }
>> +
>> +##
>> +# @x-query-registers:
>> +#
>> +# @cpu: the CPU number to query. If omitted, queries all CPUs
>> +#
>> +# Query information on the CPU registers
>> +#
>> +# Returns: CPU state in an architecture-specific format
>> +#
>> +# Since: 6.2
> 
> ...the prevailing style.
> 
> If it were likely that someone might backport just some (but not all)
> added x- commands, it may be wise to separate the creation of
> HumanReadableText into its own patch to backport that but not
> x-query-registers.  But I rather suspect anyone backporting this will
> take the series wholesale, so the coupling in this patch is not worth
> worrying about.

IIUC the problem is this breaks bisection, as you get a QAPI error:

 qapi/qapi-commands-machine.c:123:13: error:
‘qmp_marshal_output_HumanReadableText’
defined but not used [-Werror=unused-function]
  123 | static void
qmp_marshal_output_HumanReadableText(HumanReadableText *ret_in,
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

See the comment added in commit 1f7b9f3181e
("qapi/commands: add #if conditions to commands").

> 
>> +##
>> +{ 'command': 'x-query-registers',
>> +  'data': {'*cpu': 'int' },
>> +  'returns': 'HumanReadableText' }
>> -- 
>> 2.31.1
>>
> 


