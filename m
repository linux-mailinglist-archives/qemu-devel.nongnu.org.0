Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D464C4CA956
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 16:44:44 +0100 (CET)
Received: from localhost ([::1]:53762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPR9f-0005nG-IM
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 10:44:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>) id 1nPR8r-00058l-Dy
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 10:43:53 -0500
Received: from [2a00:1450:4864:20::32b] (port=44984
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>) id 1nPR8p-0007Fl-Rg
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 10:43:53 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 bg31-20020a05600c3c9f00b00381590dbb33so1495874wmb.3
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 07:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2I6JPyrthINxZu8Py6W1JMO51xRjFx6k4iWfaaXAiM8=;
 b=SE3oA7aPE1gkfo3AQ0etEGCNve3E/HEDX8174KefBh4gqGs5b5rObYAmqCq0hFBHoG
 sNIsMCtCe0Jr+6/wjtGBCDsYc49E3L1bfE+mTOC6W3Mak83u3NGumW3S9x1pR3/6d4hy
 rsJSXb71CJRNkTw3JBixEAMMn378Zi9NZPMUNlm8mEWXZxPC2gIBgdkSrmw3820mcGkJ
 zpFPBU9/x2i+JZn2CLVbhM5vSRn2jYn7FSBuNtNkOQ92NYxJhTXcudDi/cM0QDDjYWAI
 8Zg2dxrPo9N7T+lseACSGf7eWY1vnh5N9aRONjX9OCr+/4DfcRsuR3KdzJF9Eaw6gVA6
 j12w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2I6JPyrthINxZu8Py6W1JMO51xRjFx6k4iWfaaXAiM8=;
 b=wCXGZfOOVGxf4l0SOHgn+LLHFPI1oU75b7CboPRG1NbvXIs8y5y5F9A1nzgAHx8OlJ
 5MnueJY6HShbZQVaVoHojdtuIUrV2HsrSHuk0HL5tBO+EUrhkSUvhqXB8VDEOEdU9zzy
 hZmih05H/WeL5mHGTmAYONtzEHE6yjJVpLTJQ6f2xExyf4IvjCd7L3oH+kbIY8eCJduz
 Jnt5Lr+owLZGpjmjLOzMOYW+jcMGA9Y/Ubm+VGqiElAitVDxR95kFVolL3pJk6w/E9zG
 vpE/KP41uuqOiGnmXGeA5BxjjUKnQzLYS9evhnj1Q/AeDZmJt0qKEbgDOXO4OVj9q+AJ
 e/yg==
X-Gm-Message-State: AOAM530HufqWmAkBdz6FOYou/eXlX83a5r8TLkOcrmjSorjh7261V3ud
 ceALA1zt0BI9TtNqiGWH2no=
X-Google-Smtp-Source: ABdhPJxCT3kHpc57Amf+dm3PRC8W95jqqORWWBf1d7yzujTtl3ZYv5R3EXd7o1rPanfaS0y9eRkhhQ==
X-Received: by 2002:a7b:cb44:0:b0:37c:4e2d:3bb2 with SMTP id
 v4-20020a7bcb44000000b0037c4e2d3bb2mr311198wmj.96.1646235829273; 
 Wed, 02 Mar 2022 07:43:49 -0800 (PST)
Received: from ?IPV6:2a10:800b:ea29:1:266:a58e:9f87:7014?
 ([2a10:800b:ea29:1:266:a58e:9f87:7014])
 by smtp.gmail.com with ESMTPSA id
 l26-20020a05600c1d1a00b00380def7d3desm6620704wms.17.2022.03.02.07.43.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Mar 2022 07:43:48 -0800 (PST)
Message-ID: <b62abe9b-0b69-a55b-aab8-d4efcc633dc4@gmail.com>
Date: Wed, 2 Mar 2022 17:43:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v4 2/3] hw/acpi: add indication for i8042 in IA-PC boot
 flags of the FADT table
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>
References: <20220228201733.714580-1-liavalb@gmail.com>
 <20220228201733.714580-3-liavalb@gmail.com>
 <20220301094354.1d37f470@redhat.com>
 <alpine.DEB.2.22.394.2203011514030.1522204@anisinha-lenovo>
 <3face56c-7488-6736-6394-af1d9979d00f@gmail.com>
 <CAARzgwy2SWi_SmL_YSz0Dio=ynrO_ZUtAASFpiu3-sgMagSY0g@mail.gmail.com>
 <20220302074022-mutt-send-email-mst@kernel.org>
From: Liav Albani <liavalb@gmail.com>
In-Reply-To: <20220302074022-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=liavalb@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>, shentey@gmail.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 3/2/22 14:42, Michael S. Tsirkin wrote:
> On Wed, Mar 02, 2022 at 10:44:03AM +0530, Ani Sinha wrote:
>> On Wed, Mar 2, 2022 at 12:50 AM Liav Albani <liavalb@gmail.com> wrote:
>>>
>>> On 3/1/22 11:52, Ani Sinha wrote:
>>>> On Tue, 1 Mar 2022, Igor Mammedov wrote:
>>>>
>>>>> On Mon, 28 Feb 2022 22:17:32 +0200
>>>>> Liav Albani <liavalb@gmail.com> wrote:
>>>>>
>>>>>> This can allow the guest OS to determine more easily if i8042 controller
>>>>>> is present in the system or not, so it doesn't need to do probing of the
>>>>>> controller, but just initialize it immediately, before enumerating the
>>>>>> ACPI AML namespace.
>>>>>>
>>>>>> This change only applies to the x86/q35 machine type, as it uses FACP
>>>>>> ACPI table with revision higher than 1, which should implement at least
>>>>>> ACPI 2.0 features within the table, hence it can also set the IA-PC boot
>>>>>> flags register according to the ACPI 2.0 specification.
>>>>>>
>>>>>> Signed-off-by: Liav Albani <liavalb@gmail.com>
>>>>>> ---
>>>>>>    hw/acpi/aml-build.c         | 11 ++++++++++-
>>>>>>    hw/i386/acpi-build.c        |  9 +++++++++
>>>>>>    hw/i386/acpi-microvm.c      |  9 +++++++++
>>>>> commit message says it's q35 specific, so wy it touched microvm anc piix4?
>>>> Igor is correct. Although I see that currently there are no 8042 devices
>>>> for microvms, maybe we should be conservative and add the code to detect
>>>> the device anyway. In that case, the change could affect microvms too when
>>>> such devices get added in the future.
>>>>
>>>>
>>>> echo -e "info qtree\r\nquit\r\n" | ./qemu-system-x86_64 -machine microvm
>>>> -monitor stdio 2>/dev/null | grep 8042
>>>>
>>>> <empty>
>>> What about this?
>>>
>>> echo -e "info qtree\r\nquit\r\n" | qemu-system-x86_64 -machine microvm
>>> -device i8042 -monitor stdio 2>/dev/null | grep 8042
>>>
>>> Or this?
>>>
>>> echo -e "info mtree\r\nquit\r\n" | qemu-system-x86_64 -machine microvm
>>> -device i8042 -monitor stdio 2>/dev/null | grep 8042
>> On both occasions you are explicitly adding the device.
> Yes of course. It seems a bit cleaner to have -device i8042 -monitor
> stdio give us the correct ACPI table even if there's no pressing need
> for this ATM, simply because it's not much more code, and because if we
> don't we risk guests trying to work around incorrect ACPI tables.
> Let us however do this in a patch by its own with proper
> documentation and motivation.
>
So if I understand how to do this now - I should drop the code for the 
MicroVM ACPI for now, letting only to change the Q35 FACP table, right? 
So if that's the case I should send it in a separate patch?

If that's the case, as suggested by you and Ani, I'll not add a separate 
function to reduce code duplication as there's no such thing in such case...


