Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A852E0D27
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 17:19:48 +0100 (CET)
Received: from localhost ([::1]:43214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krkO3-00011V-Ez
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 11:19:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1krkLA-0008PI-1t
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 11:16:48 -0500
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b]:37755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1krkL8-00041E-6A
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 11:16:47 -0500
Received: by mail-oo1-xc2b.google.com with SMTP id p72so3063607oop.4
 for <qemu-devel@nongnu.org>; Tue, 22 Dec 2020 08:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:to:cc:from:subject:autocrypt:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=INSPifEyH8MGQfzYMBNRfz91LM7RYeWNrM5dJ0NyyDs=;
 b=WSNCdoW/+sxAXDRv7jca2m6qdRd9PHIfeaB0/qA3CQsdZmqMlk/PGoi1IInCbW0T7O
 ++M/s+cn/vzVwQoNe9PyKkufH2Beb7ig7rliO9UkwZw0L73VcJDkDHhbVlDnD7fuqAIn
 orVgzHWz1lK2DoQ7Bkdya+QqUEyvPR1FQ4yeYzNFJg8W7PJHtFmhCMP1ejaOz6gk8qX9
 C2gqZ5eWxm8/mV4KGKUJEdkY0+VHKqkWcOqd0Lb34wMuzb1nvx507yZcbXahnsCbJivN
 Jj2iqnp0fCdv7oMMfCf2JTXxIQcgKtZYTx7nRVIGqWprBZfMqPyiwXjVHqxxbOPLb9Z0
 KTXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:to:cc:from:subject:autocrypt:message-id
 :date:user-agent:mime-version:content-language
 :content-transfer-encoding;
 bh=INSPifEyH8MGQfzYMBNRfz91LM7RYeWNrM5dJ0NyyDs=;
 b=NV/32hLnrD+WS8rd+0wHyjzjKF1bUtckjfvr+nxAv69FqM5PSsJshjygxEWNrZcEQH
 aIhCVN1Jh4S+67PG7XEn1VcI1lwp8NG8BcdfehK9seFZ3mIZ0uvwOiC8dOnfS+Z9P5L9
 zgyvX6YCH9I9ZwiHeOsrpT/LoBEN6f9k9Q70QoDSBCkl754zLU4/2wJ3pujK6YNNHxlD
 2GKhu49T/ji3guDk7JnLpORXgIpUiSSOUTdhoIZATvsWPQv/Ib/ifox1cEyTBV6TTAQX
 gNJdIpoEc/b4VmVzMzYg4ssF6ZQ3mCJOurrKkn0Cbfb3us7aFt3iZvC8qLYfy6NqA0DY
 3vxQ==
X-Gm-Message-State: AOAM531HTgflxfGYIFhqH/7r5M9elJwSOfMjxV8uBmUSdVI1Br2XSlEX
 fCrrqcP0YHLt1vVTAH9L+8U=
X-Google-Smtp-Source: ABdhPJy4/jsL9lui0RwGdK55/Siv5ztPddlJ6Js5efpL9HdLhQZjZBxZTMjm4G5QVGYFYiHnxQyQhw==
X-Received: by 2002:a05:6820:34b:: with SMTP id
 m11mr5045008ooe.74.1608653804315; 
 Tue, 22 Dec 2020 08:16:44 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 c12sm1626621ots.7.2020.12.22.08.16.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Dec 2020 08:16:43 -0800 (PST)
To: QEMU Developers <qemu-devel@nongnu.org>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Problems with irq mapping in qemu v5.2
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <3f0f8fc6-6148-a76e-1088-b7882b0bbcaf@roeck-us.net>
Date: Tue, 22 Dec 2020 08:16:41 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2b;
 envelope-from=groeck7@gmail.com; helo=mail-oo1-xc2b.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

commit 459ca8bfa41 ("pci: Assert irqnum is between 0 and bus->nirqs in
pci_bus_change_irq_level") added sanity checks to the interrupt number passed
to pci_bus_change_irq_level(). That makes sense, given that bus->irq_count
is indexed and sized by the number of interrupts.

However, as it turns out, the interrupt number passed to this function
is the _mapped_ interrupt number. The result in assertion failures for various
emulations.

Examples (I don't know if there are others):

- ppc4xx_pci_map_irq() maps the interrupt number to "slot - 1". Obviously
  that isn't a good thing to do for slot 0, and indeed results in an
  assertion as soon as slot 0 is initialized (presumably that is the root
  bridge). Changing the mapping to "slot" doesn't help because valid slots
  are 0..4, and only four interrupts are allocated.
- pci_bonito_map_irq() changes the mapping all over the place. Whatever
  it does, it returns numbers starting with 32 for slots 5..12. With
  a total number of 32 interrupts, this again results in an assertion
  failure.

ppc4xx_pci_map_irq() is definitely buggy. I just don't know what the
correct mapping should be. slot  & 3, maybe ?

I don't really have a good solution for pci_bonito_map_irq(). It may not
matter much - I have not been able to boot fuloong_2e since qemu v4.0,
and afaics that is the only platform using it. Maybe it is just completely
broken ?

Thanks,
Guenter

