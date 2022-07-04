Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B92EF565A01
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 17:38:23 +0200 (CEST)
Received: from localhost ([::1]:43708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8O9W-00073g-TF
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 11:38:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8O7p-000512-Vm
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 11:36:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8O7m-0004im-Rc
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 11:36:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656948993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SjIAtRMK2hYF1R1LPjJvBdRxiMDkHqqsVARyrr3dYZI=;
 b=ODDMnP4uqPun8+iHFW0V4fJhkWVC0QCJca/whzneUkcEl6AwOUULiwkcyk6ZpmKV4TlMEH
 8FM/2u2NJ5xyaatnmkt29UKtUf0cGXWbzN4Bs86DBMTZcDo8ngMvBMoIqRnGWMVMyZAreV
 BjNB3w2UmOiPRfLyh8gZ4ACdLYKxyCo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-513-jzYkssHQN9qHycih78aKkQ-1; Mon, 04 Jul 2022 11:36:33 -0400
X-MC-Unique: jzYkssHQN9qHycih78aKkQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 t14-20020a056402524e00b0043595a18b91so7361369edd.13
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 08:36:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SjIAtRMK2hYF1R1LPjJvBdRxiMDkHqqsVARyrr3dYZI=;
 b=Vq6HArmB4sc2p4LkcmIaD4aehPr83kdGgfs5ml0/atKvxBhMfT62zu1PMSetAckyTj
 +RjgRCyORySBuXhZqPhWqoghsW5OSKHGLJV1I6zCLTE+Iqji7r4D5l0FZXlr27si1BfY
 u8JhVly5e+XNkwKGMDDvp6eXr2VowrrG5qZ6yVKTej6FS44Y+LEM0dDrjxGM83777ehi
 eTTmgUkE6y4EzSQztv0KApQi7JBCllfKDi30ZlBpyR4xHgz83+Ca9mIF6tDl2jzjGEam
 sn5iToY2j4abNQoK9GSZvWCpfP65i/tI6AzrNiUp0f33NyReYliUielHNi1nErjQ+bYp
 rHVw==
X-Gm-Message-State: AJIora/az9waB7lu4bxP6cD4EfsEzLCkRJxKembdKGQniRiVUooNbpxs
 Vb7ZK44uGbf2c+BGjKN/XQ1VWfNQknAluS/wsFf/Qt44uVZIoPmZgnNW6f5yZM0RPS/bi8Iww1g
 SE1NAaMvy0HClVkE=
X-Received: by 2002:a17:906:378e:b0:726:38df:6f75 with SMTP id
 n14-20020a170906378e00b0072638df6f75mr27803206ejc.577.1656948991927; 
 Mon, 04 Jul 2022 08:36:31 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vlisjAWlA8N4EFBbP/Nn1e+hdUrUigJP4+YFCmGBdxJJdprxNaVamV2t/F1kWfq1qF5s/nNQ==
X-Received: by 2002:a17:906:378e:b0:726:38df:6f75 with SMTP id
 n14-20020a170906378e00b0072638df6f75mr27803193ejc.577.1656948991745; 
 Mon, 04 Jul 2022 08:36:31 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 a4-20020a170906274400b00726b03f83a0sm10062608ejd.33.2022.07.04.08.36.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 08:36:31 -0700 (PDT)
Message-ID: <c0b0f2ca-768f-f012-05f5-96b7fe1d6188@redhat.com>
Date: Mon, 4 Jul 2022 17:36:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 02/10] tests/qemu-iotests: skip 108 when FUSE is not
 loaded
Content-Language: en-US
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Beraldo Leal <bleal@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220616142659.3184115-1-jsnow@redhat.com>
 <20220616142659.3184115-3-jsnow@redhat.com>
 <b3e95451-77e3-7e4d-bb2c-664bdbaae9c9@redhat.com>
 <CAFn=p-Zf_RfXgtHp_DMO57ggLWWSVSaRqm62CUte0ODuesDb1w@mail.gmail.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <CAFn=p-Zf_RfXgtHp_DMO57ggLWWSVSaRqm62CUte0ODuesDb1w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01.07.22 18:15, John Snow wrote:
> On Fri, Jul 1, 2022 at 4:05 AM Hanna Reitz <hreitz@redhat.com> wrote:
>> On 16.06.22 16:26, John Snow wrote:
>>> In certain container environments we may not have FUSE at all, so skip
>>> the test in this circumstance too.
>>>
>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>> ---
>>>    tests/qemu-iotests/108 | 5 +++++
>>>    1 file changed, 5 insertions(+)
>> Reviewed-by: Hanna Reitz <hreitz@redhat.com>
>>
> Hanna, if you want to take just the first two, be my guest.

Thanks for the invite, always happy to be your guest!

(Applied to my block branch:)

https://gitlab.com/hreitz/qemu/-/commits/block

Hanna


