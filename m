Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B2E45087F
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 16:32:03 +0100 (CET)
Received: from localhost ([::1]:46300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmdxi-00028u-8J
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 10:32:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mmdub-0008SS-3l
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 10:28:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mmduU-00044X-M9
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 10:28:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636990121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=crVDgUFmpmZO9nTQH6bGuGTZLTK4QCeBv9bNIsWhg5c=;
 b=Q48iZ0h9BGhgvruHlOuqK8eUaXfkVeQ5/2hyGqEXlWPf6+6vwtmLcBREcsRBgwSmgW4lx7
 4zmPoRbMtBaed7V+5tLvJTJmShrYQKo7wHTcS1ZZEvRmnSuFgfzq3P8L2dOJ9eNfGp58SI
 OdFttu0No7wylZOCfIE4sISfe0Q665Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-qo0B8a7mOSyRLIftShn8Ng-1; Mon, 15 Nov 2021 10:28:37 -0500
X-MC-Unique: qo0B8a7mOSyRLIftShn8Ng-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9C8F18414A0;
 Mon, 15 Nov 2021 15:28:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CE0F160BE5;
 Mon, 15 Nov 2021 15:28:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 498DE11380A7; Mon, 15 Nov 2021 16:28:33 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: On configuring onboard block devices with -blockdev (was: [PATCH v4
 6/7] hw/nvram: Update at24c EEPROM init function in NPCM7xx boards)
References: <20211103220133.1422879-1-wuhaotsh@google.com>
 <20211103220133.1422879-4-wuhaotsh@google.com>
 <YZJeU5fCxR07hmJQ@redhat.com>
Date: Mon, 15 Nov 2021 16:28:33 +0100
In-Reply-To: <YZJeU5fCxR07hmJQ@redhat.com> (Kevin Wolf's message of "Mon, 15
 Nov 2021 14:19:15 +0100")
Message-ID: <875ystigke.fsf_-_@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, qemu-block@nongnu.org,
 venture@google.com, bin.meng@windriver.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, hskinnemoen@google.com, Hao Wu <wuhaotsh@google.com>,
 kfting@nuvoton.com, qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com,
 armbru@redhat.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> Am 03.11.2021 um 23:01 hat Hao Wu geschrieben:
>> We made 3 changes to the at24c_eeprom_init function in
>> npcm7xx_boards.c:
>> 
>> 1. We allow the function to take a I2CBus* as parameter. This allows
>>    us to attach an EEPROM device behind an I2C mux which is not
>>    possible with the old method.
>> 
>> 2. We make at24c EEPROMs are backed by drives so that we can
>>    specify the content of the EEPROMs.
>> 
>> 3. Instead of using i2c address as unit number, This patch assigns
>>    unique unit numbers for each eeproms in each board. This avoids
>>    conflict in providing multiple eeprom contents with the same address.
>>    In the old method if we specify two drives with the same unit number,
>>    the following error will occur: `Device with id 'none85' exists`.
>> 
>> Signed-off-by: Hao Wu <wuhaotsh@google.com>
>> ---
>>  hw/arm/npcm7xx_boards.c | 14 +++++++++-----
>>  1 file changed, 9 insertions(+), 5 deletions(-)
>> 
>> diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
>> index dec7d16ae5..9121e081fa 100644
>> --- a/hw/arm/npcm7xx_boards.c
>> +++ b/hw/arm/npcm7xx_boards.c
>> @@ -126,13 +126,17 @@ static I2CBus *npcm7xx_i2c_get_bus(NPCM7xxState *soc, uint32_t num)
>>      return I2C_BUS(qdev_get_child_bus(DEVICE(&soc->smbus[num]), "i2c-bus"));
>>  }
>>  
>> -static void at24c_eeprom_init(NPCM7xxState *soc, int bus, uint8_t addr,
>> -                              uint32_t rsize)
>> +static void at24c_eeprom_init(I2CBus *i2c_bus, int bus, uint8_t addr,
>> +                              uint32_t rsize, int unit_number)
>>  {
>> -    I2CBus *i2c_bus = npcm7xx_i2c_get_bus(soc, bus);
>>      I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", addr);
>>      DeviceState *dev = DEVICE(i2c_dev);
>> +    DriveInfo *dinfo;
>>  
>> +    dinfo = drive_get(IF_OTHER, bus, unit_number);
>> +    if (dinfo) {
>> +        qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(dinfo));
>> +    }
>
> I may be missing the history of this series, but why do we have to use a
> legacy DriveInfo here instead of adding a drive property to the board to
> make this configurable with -blockdev?
>
> Adding even more devices that can only be configured with -drive feels
> like a step backwards to me.

More like sideways.

The big unfinished part of -blockdev is configuring onboard devices with
it.

I took a stab at one instance in commit ebc29e1bea "pc: Support firmware
configuration with -blockdev", 2019-03-11.  Quoting from the commit
message:

    Mapping -drive if=none,... to -blockdev is a solved problem.  With
    if=T other than if=none, -drive additionally configures a block device
    frontend.  For non-onboard devices, that part maps to -device.  Also a
    solved problem.  For onboard devices such as PC flash memory, we have
    an unsolved problem.

    This is actually an instance of a wider problem: our general device
    configuration interface doesn't cover onboard devices.  Instead, we have
    a zoo of ad hoc interfaces that are much more limited.  One of them is
    -drive, which we'd rather deprecate, but can't until we have suitable
    replacements for all its uses.

    Sadly, I can't attack the wider problem today.  So back to the narrow
    problem.

    My first idea was to reduce it to its solved buddy by using pluggable
    instead of onboard devices for the flash memory.  Workable, but it
    requires some extra smarts in firmware descriptors and libvirt.  Paolo
    had an idea that is simpler for libvirt: keep the devices onboard, and
    add machine properties for their block backends.

    The implementation is less than straightforward, I'm afraid.

    First, block backend properties are *qdev* properties.  Machines can't
    have those, as they're not devices.  I could duplicate these qdev
    properties as QOM properties, but I hate that.

    More seriously, the properties do not belong to the machine, they
    belong to the onboard flash devices.  Adding them to the machine would
    then require bad magic to somehow transfer them to the flash devices.
    Fortunately, QOM provides the means to handle exactly this case: add
    alias properties to the machine that forward to the onboard devices'
    properties.

    Properties need to be created in .instance_init() methods.  For PC
    machines, that's pc_machine_initfn().  To make alias properties work,
    we need to create the onboard flash devices there, too.  Requires
    several bug fixes, in the previous commits.  We also have to realize
    the devices.  More on that below.

The need to create onboard devices differently results in a non-trivial
refactoring.  The need for keeping -drive working complicates things
further.

The "several bug fixes" took me 26 preparatory patches, plus at least
three more to fix regressions caused by one of them.

I then did the same for ARM virt in commit e0561e60f1 "hw/arm/virt:
Support firmware configuration with -blockdev", 2019-05-07.  Only a few
preparatory patches, but the patch again includes non-trivial
refactoring.

Two new machines (ARM sbsa-ref and RISC-V virt) have since done it this
way from the start, both in 2019.  Definitely easier than the
refactoring I did for PC machines and ARM virt.

More than a hundred drive_get() remain in some 70 files hw/.  These
should all be for onboard block devices.  I'm not aware of progress
since 2019.

If "replace them all by machine properties" is the way forward, we need
to get going.  At the current rate of one file a year (measured
charitably), we'll be done around 2090, provided we don't add more
(we've added quite a few since I did the first replacement).

If it isn't a practical way forward, then what is?

And this is what makes me go "more like sideways".  Hao Wu is doing what
the vast majority of the code does.  Yes, that's not moving us forward
on this thorny set of problems.  But it's hardly setting us back,
either.

Before we can ask people to help us move forward, we need to find the
way forward.  I'm not sure we have.


