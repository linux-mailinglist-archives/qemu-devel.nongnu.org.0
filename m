Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FABA67543F
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 13:13:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIqFz-0004dY-Ja; Fri, 20 Jan 2023 07:12:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pIqFx-0004d9-Po
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:12:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pIqFw-0005hW-CD
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:12:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674216747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8nMcQ/SSp1CsoDIgufVnjeQz+anrr2HiTCkaNW+Aw5Y=;
 b=OJ9Qik5CsHvXXyNtFSyifodOVddgb9vlv5FBH/qmhg3czTvYdMO0cjQu8K/4tk8gLDEWiR
 1PSwBSW7AGIyFIx9qD84H2sENQpQEaPVoWSHeE83uJ5NC+rkZsPfQ0dXZOD9YUSLuAqUPi
 ZB5eYEOfixZHFHGFgVGLizeTR/jSj3Y=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-537-czTYfxwrO_OyfyHY_zkJHQ-1; Fri, 20 Jan 2023 07:12:21 -0500
X-MC-Unique: czTYfxwrO_OyfyHY_zkJHQ-1
Received: by mail-qt1-f200.google.com with SMTP id
 c18-20020ac84e12000000b003b5d38f1d29so2341323qtw.0
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 04:12:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8nMcQ/SSp1CsoDIgufVnjeQz+anrr2HiTCkaNW+Aw5Y=;
 b=ymXR2m90FLbqH/CeXhpt73yDTsYQo4QL4WtUe05pa9zxY05Ggti6xjjDd9jnbmWZct
 S+v/yQn/nA02ciHv1V+Iymo/BiXF0v1P7HFZqCGJAZwc9eG7KzCIscttMv0LBrNiJSht
 tJGBGa03pH+ou08MwtEH96J6+6xBU2fyJIhopwNgd46i3jx7Wa5mw4zIvemXZU9qqghL
 JVbLbgDh5NrjWpNixKJHVAVFtd5MQ3mAIzUd72Nuoip2ucdS4rLSeEAkBAZyTOd23BH6
 2P+LZfHZX6p+2jCSkJpg2h6XcdI6T8J7Z0RGpcvcYl7+IYvpcAuR5J8mHmDeZnN/Ijcs
 Da8Q==
X-Gm-Message-State: AFqh2krhtS/9NxSXR4zoQVmQthmuu/OXSs4ydqTqRutrfKXwQflfxamR
 ibx1JeDs7IZrhYiddSfLOmBU8z4xVh+xqcHvoslHEXPFiKZcA0PYvzBrnsEkfzbQLbepXywb00m
 3KOymzl1CK5twdHA=
X-Received: by 2002:ac8:678e:0:b0:3b6:3df9:22ae with SMTP id
 b14-20020ac8678e000000b003b63df922aemr19231980qtp.18.1674216740856; 
 Fri, 20 Jan 2023 04:12:20 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtfTAB4iKbnQD4B1YHFhDwBVq5hlO0EMrT20QNaTK7wAWhmWE6ThhU7sUkAixN3UES1a/GVrw==
X-Received: by 2002:ac8:678e:0:b0:3b6:3df9:22ae with SMTP id
 b14-20020ac8678e000000b003b63df922aemr19231936qtp.18.1674216740473; 
 Fri, 20 Jan 2023 04:12:20 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-118.web.vodafone.de.
 [109.43.177.118]) by smtp.gmail.com with ESMTPSA id
 d2-20020ac81182000000b0039cd4d87aacsm20120159qtj.15.2023.01.20.04.12.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Jan 2023 04:12:19 -0800 (PST)
Message-ID: <7a6d10ea-3396-f70a-db4f-36b32379f376@redhat.com>
Date: Fri, 20 Jan 2023 13:12:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC PATCH v4 06/15] tests/qtest: Add qtest_get_machine_args
Content-Language: en-US
To: Cornelia Huck <cohuck@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Laurent Vivier <lvivier@redhat.com>
References: <20230119135424.5417-1-farosas@suse.de>
 <20230119135424.5417-7-farosas@suse.de>
 <20717e57-8524-5bca-efc3-ff294cda34f6@redhat.com> <87wn5hh0uy.fsf@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <87wn5hh0uy.fsf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 20/01/2023 13.00, Cornelia Huck wrote:
> On Fri, Jan 20 2023, Thomas Huth <thuth@redhat.com> wrote:
> 
>> On 19/01/2023 14.54, Fabiano Rosas wrote:
>>> QEMU machines might not have a default value defined for the -cpu
>>> option.
>>
>> Which machines for example? ... I thought we'd have a default CPU everywhere?
> 
> There's a patch further above that removes it for KVM on Arm... do you
> think that's a bad idea? In that case, I'm not sure what the default for
> that case should even be...

Well, if there is just one machine in the whole of QEMU that does not have a 
default CPU anymore, that calls for trouble, I think (as we can already see 
in this series where you have to rework a lot of qtests). It's likely better 
to set another CPU as default in that machine in that case. What about 
simply using "max" or "host" if TCG is disabled there?

  Thomas


