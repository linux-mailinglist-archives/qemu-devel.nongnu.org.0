Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 650C16D5C8E
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 12:01:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjdSe-00021r-QQ; Tue, 04 Apr 2023 06:00:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jinpu.wang@ionos.com>)
 id 1pjdSd-00021i-08
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 06:00:19 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jinpu.wang@ionos.com>)
 id 1pjdSY-0002NC-UU
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 06:00:18 -0400
Received: by mail-ed1-x52a.google.com with SMTP id eh3so128212647edb.11
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 03:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ionos.com; s=google; t=1680602412;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BHSJQ4cL/CUgakvw7I9Aj6OlgZdjFyBw4hAssO7X0qM=;
 b=Ai8dbsKG92qUlxgt5EVhcQTmeP5G8osU3GEvAIw8ZOlKY3jdoYHTtzr3jz8bbYvoDC
 NNyRbrOrUxvAAa/UZ9W+lFPGxhm8vHoKOyPwONvtThTh9C6MTJS960jvQ5V3f3hgVXVO
 hJVG7/90Ndd6cTnA2JDHr9copLQt2J5mQTff5FqwGpztNQZJT/BEBwyvjFU/yW+5qmA2
 AA5BLIKQM5kNtyy7lCj2GaYbklahycqRGVRuvMQ/mYAQE9nBWgZPuU+EYo3Dlqr5paiV
 a5gVarptkvfzSTRhwu2hB1Wb6mqF0vumiAEIMf7mS8eXavbETGVJ7BtR1nYMUtuJTPGz
 kGAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680602412;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BHSJQ4cL/CUgakvw7I9Aj6OlgZdjFyBw4hAssO7X0qM=;
 b=xxPE3sDhiKvxttKqmBDNqIvRxG1krw+mCApxg6YMD64SQIfvs/9Taam82gP3gIGzOz
 sypuQIMhY5Txxk24img+CigkUatp1Nscaoq9aNInTfwZFcaGiMrdacpNoPONedzuMXnK
 3deDazdX/Uia9kFVjBEAHs7Dekc8s6d2T0Iv5jBLrxd7I3BICGcS4izI81vYzrx4DBYe
 dP/jopak896y7IZ4bqqFgAesJAPGrjCysBLgGl8Kh7q8xrmsFNSKtWc+2/IWstB2wAXX
 KrVby+MTaiFI4rwj5sSeDeo8R3RIEajr2TB0ZFf6D5YE6J5gszSxW3u0/8y6w215ndUc
 kJ1A==
X-Gm-Message-State: AAQBX9dmFXuXbw9h8xlOZtsibcNRhH0yRr9SAMv7IkyksgW5ff86lAEN
 fMtjgiii473s9MsvkHFmHCTsZC6Be/ZTANQQGU5W7A==
X-Google-Smtp-Source: AKy350ZWgRjElJRKehnTH5fgoYMywYyub7ZQKkS8uZjyhZqhCGRsQGivEUoPJYCkySskm3j4b3axu2vXHCR8gNB8WrA=
X-Received: by 2002:a17:906:8458:b0:934:b24e:26ba with SMTP id
 e24-20020a170906845800b00934b24e26bamr886330ejy.7.1680602412632; Tue, 04 Apr
 2023 03:00:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAHEcVy5SV34jaubY5F-q=H+smvMVOzKbb=rTaNJDNXyGdFaLZg@mail.gmail.com>
 <94e21f89-0a3e-701b-7171-7398dff9ce46@redhat.com>
 <CAHEcVy5TiQwYofhCe3RpdFopYzYWbGnL7EO5nE_HQTAVEeaqAg@mail.gmail.com>
In-Reply-To: <CAHEcVy5TiQwYofhCe3RpdFopYzYWbGnL7EO5nE_HQTAVEeaqAg@mail.gmail.com>
From: Jinpu Wang <jinpu.wang@ionos.com>
Date: Tue, 4 Apr 2023 12:00:01 +0200
Message-ID: <CAMGffEnykE2ZbtGt7G3tpEdRj3QmYZq88cyFRorCEuvWuUoYGA@mail.gmail.com>
Subject: Re: an issue for device hot-unplug
To: Yu Zhang <yu.zhang@ionos.com>, Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Elmar Gerdes <elmar.gerdes@ionos.com>,
 imammedo@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: permerror client-ip=2a00:1450:4864:20::52a;
 envelope-from=jinpu.wang@ionos.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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

Hi Yu and Laurent,

On Mon, Apr 3, 2023 at 6:59=E2=80=AFPM Yu Zhang <yu.zhang@ionos.com> wrote:
>
> Dear Laurent,
>
> Thank you for your quick reply. We used qemu-7.1, but it is reproducible =
with qemu from v6.2 to the recent v8.0 release candidates.
> I found that it's introduced by the commit  9323f892b39 (between v6.2.0-r=
c2 and v6.2.0-rc3).
>
> If it doesn't break anything else, it suffices to remove the line below f=
rom acpi_pcihp_device_unplug_request_cb():
>
>     pdev->qdev.pending_deleted_event =3D true;
>
> but you may have a reason to keep it. First of all, I'll open a bug in th=
e bug tracker and let you know.
>
We opened an issue here:
https://gitlab.com/qemu-project/qemu/-/issues/1577

Regards!
Jinpu Wang
> Best regards,
> Yu Zhang
>
> On Mon, Apr 3, 2023 at 6:32=E2=80=AFPM Laurent Vivier <lvivier@redhat.com=
> wrote:
>>
>> Hi Yu,
>>
>> please open a bug in the bug tracker:
>>
>> https://gitlab.com/qemu/qemu/-/issues
>>
>> It's easier to track the problem.
>>
>> What is the version of QEMU you are using?
>> Could you provide QEMU command line?
>>
>> Thanks,
>> Laurent
>>
>>
>> On 4/3/23 15:24, Yu Zhang wrote:
>> > Dear Laurent,
>> >
>> > recently we run into an issue with the following error:
>> >
>> > command '{ "execute": "device_del", "arguments": { "id": "virtio-diskX=
" } }' for VM "id"
>> > failed ({ "return": {"class": "GenericError", "desc": "Device virtio-d=
iskX is already in
>> > the process of unplug"} }).
>> >
>> > The issue is reproducible. With a few seconds delay before hot-unplug,=
 hot-unplug just
>> > works fine.
>> >
>> > After a few digging, we found that the commit 9323f892b39 may incur th=
e issue.
>> > ------------------
>> >      failover: fix unplug pending detection
>> >
>> >      Failover needs to detect the end of the PCI unplug to start migra=
tion
>> >      after the VFIO card has been unplugged.
>> >
>> >      To do that, a flag is set in pcie_cap_slot_unplug_request_cb() an=
d reset in
>> >      pcie_unplug_device().
>> >
>> >      But since
>> >          17858a169508 ("hw/acpi/ich9: Set ACPI PCI hot-plug as default=
 on Q35")
>> >      we have switched to ACPI unplug and these functions are not calle=
d anymore
>> >      and the flag not set. So failover migration is not able to detect=
 if card
>> >      is really unplugged and acts as it's done as soon as it's started=
. So it
>> >      doesn't wait the end of the unplug to start the migration. We don=
't see any
>> >      problem when we test that because ACPI unplug is faster than PCIe=
 native
>> >      hotplug and when the migration really starts the unplug operation=
 is
>> >      already done.
>> >
>> >      See c000a9bd06ea ("pci: mark device having guest unplug request p=
ending")
>> >          a99c4da9fc2a ("pci: mark devices partially unplugged")
>> >
>> >      Signed-off-by: Laurent Vivier <lvivier@redhat.com <mailto:lvivier=
@redhat.com>>
>> >      Reviewed-by: Ani Sinha <ani@anisinha.ca <mailto:ani@anisinha.ca>>
>> >      Message-Id: <20211118133225.324937-4-lvivier@redhat.com
>> > <mailto:20211118133225.324937-4-lvivier@redhat.com>>
>> >      Reviewed-by: Michael S. Tsirkin <mst@redhat.com <mailto:mst@redha=
t.com>>
>> >      Signed-off-by: Michael S. Tsirkin <mst@redhat.com <mailto:mst@red=
hat.com>>
>> > ------------------
>> > The purpose is for detecting the end of the PCI device hot-unplug. How=
ever, we feel the
>> > error confusing. How is it possible that a disk "is already in the pro=
cess of unplug"
>> > during the first hot-unplug attempt? So far as I know, the issue was a=
lso encountered by
>> > libvirt, but they simply ignored it:
>> >
>> > https://bugzilla.redhat.com/show_bug.cgi?id=3D1878659
>> > <https://bugzilla.redhat.com/show_bug.cgi?id=3D1878659>
>> >
>> > Hence, a question is: should we have the line below in  acpi_pcihp_dev=
ice_unplug_request_cb()?
>> >
>> >     pdev->qdev.pending_deleted_event =3D true;
>> >
>> > It would be great if you as the author could give us a few hints.
>> >
>> > Thank you very much for your reply!
>> >
>> > Sincerely,
>> >
>> > Yu Zhang @ Compute Platform IONOS
>> > 03.04.2013
>>

