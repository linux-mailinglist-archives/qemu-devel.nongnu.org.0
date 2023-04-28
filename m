Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC52E6F134D
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 10:31:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psJV1-0003DF-Lp; Fri, 28 Apr 2023 04:30:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psJUu-0003CU-NR
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 04:30:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psJUs-0001nu-W5
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 04:30:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682670629;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=n/gz4YaXObHUbgt8R+o9S2f7JjMN3+5AWDUFo0RNPKI=;
 b=AVG2S++xwKqxjIDsZLjhnU370z4lKEk9ztqMq/88AFPRLRL0PMtkQWbPLJvEWsRCf/6tyt
 8ajy5zxaYZnOmm2sgE/RFbhwP/XacPklDLC7/3jKcY/0HLOKg+BDx+7hsobEB5vorVZNaQ
 b9RDq1FxqPDGr9OQIFM/qgC7uBDH1JQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-107-geDcrrVwNoiInASxiZmbVQ-1; Fri, 28 Apr 2023 04:30:28 -0400
X-MC-Unique: geDcrrVwNoiInASxiZmbVQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-2f55f0626a6so3527820f8f.3
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 01:30:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682670627; x=1685262627;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n/gz4YaXObHUbgt8R+o9S2f7JjMN3+5AWDUFo0RNPKI=;
 b=fcTKqgrwbJK3JuVsAJnC+h4cng2wzeyPuuZWcGNmoyitp5HOddM8Cc9EAk615hxdKu
 4QeYt2gZRYytFfFekJ3LEINLFmRirZm7r2Sp/PzvC/XXkFeNSQEjd16kFQ1v8nxk74ZO
 I51REZWKNkc08vq3Ka2IHX5qk2mfRTq2naJh7pwBbdMUXuXT+aYdYL9kYS2yi4rsSI61
 u19E0sCceIXag2jDO+KYkeg7Wx1Sx+Sq9ws6rqGvVz31AjeN9/VqMyiEKI70dGGwend+
 v3mcTyelj5P6FUvg4Jubp9uGpdHype5o4CJJQGQU1hX+A/NNNGNa2BAHuJsZ9jiaiciI
 DtGQ==
X-Gm-Message-State: AC+VfDyGAUDMQ/lERV/B4PjQK+PsPghve6MYw499j4nkd5Q4kcGLk6rD
 q3x7dqKvxofa7irISGNqtJO21hz2Lv2at2gY6xxmsfZKh4AmGmy/BK59aw3CwPLkGiOvueGw/xp
 7HbKaugsSz779D4I=
X-Received: by 2002:adf:e341:0:b0:2fe:d540:8c8e with SMTP id
 n1-20020adfe341000000b002fed5408c8emr3059439wrj.19.1682670627122; 
 Fri, 28 Apr 2023 01:30:27 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5BB4wlhsZuW47LRyYrCBtnIzojxkoTS+TFBd2Q8ivAyvlZf+OCsVO7uvofOybuzzCHVoEcTQ==
X-Received: by 2002:adf:e341:0:b0:2fe:d540:8c8e with SMTP id
 n1-20020adfe341000000b002fed5408c8emr3059413wrj.19.1682670626795; 
 Fri, 28 Apr 2023 01:30:26 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 s1-20020adff801000000b00300aee6c9cesm20568359wrp.20.2023.04.28.01.30.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 01:30:26 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org,  marcel.apfelbaum@gmail.com,  philmd@linaro.org,
 david@redhat.com,  peterx@redhat.com,  pbonzini@redhat.com,
 den-plotnikov@yandex-team.ru,  lersek@redhat.com,  kraxel@redhat.com,
 dgilbert@redhat.com,  armbru@redhat.com
Subject: Re: [PATCH v2 3/3] pci: ROM preallocation for incoming migration
In-Reply-To: <20230426002135-mutt-send-email-mst@kernel.org> (Michael
 S. Tsirkin's message of "Wed, 26 Apr 2023 00:43:57 -0400")
References: <20230425161434.173022-1-vsementsov@yandex-team.ru>
 <20230425161434.173022-4-vsementsov@yandex-team.ru>
 <20230426002135-mutt-send-email-mst@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 28 Apr 2023 10:30:25 +0200
Message-ID: <877ctwbe8u.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

"Michael S. Tsirkin" <mst@redhat.com> wrote:
> On Tue, Apr 25, 2023 at 07:14:34PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> On incoming migration we have the following sequence to load option
>> ROM:
>> 
>> 1. On device realize we do normal load ROM from the file
>> 
>> 2. Than, on incoming migration we rewrite ROM from the incoming RAM
>>    block. If sizes mismatch we fail.
>
> let's mention an example error message:
>  Size mismatch: 0000:00:03.0/virtio-net-pci.rom: 0x40000 != 0x80000: Invalid argument

This is a mess(TM).
And no easy way to fix it.  Everything has its problems.

Ok, I will elaborate.

We have source machine and destination machine.
Easy case, same version of qemu (or at least the same rom files).
The interesting ones is when the sizes are wrong.

Again this splits on two cases:
- target side is bigger
  not big deal, during migration we just don't use all the space.
- target side is smaller
  guess what, not easy way to get this working O:-)

We added some changes on the past for this, but I don't remember the
details.

If I understood his patch correctly, it set seems to try to fix this to
always do the right thing with respect to migration, i.e. using whatever
was on the source.  I think this is nice.

But we still have left out the big elephant on the ROM, what happens
when we reboot.

Right now, when we reboot we still use the rom files for the source.

And I think that in the case of reboot, if the ROM files have changed
(because there was an upgrade or we migrate to a host with a never
version, etc,) we should always do a powerdown + start to let qemu use
the new ROM files.

As far as I know, no management app does that, and especially as we move
to UEFI (i.e. more complex firmware with more posibilities for CVE's) I
think we should considerd this case.

>> @@ -2293,10 +2294,16 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
>>  {
>>      int64_t size;
>>      g_autofree char *path = NULL;
>> -    void *ptr;
>>      char name[32];
>>      const VMStateDescription *vmsd;
>>  
>> +    /*
>> +     * In case of incoming migration ROM will come with migration stream, no
>> +     * reason to load the file.  Neither we want to fail if local ROM file
>> +     * mismatches with specified romsize.
>> +     */
>> +    bool load_file = !runstate_check(RUN_STATE_INMIGRATE);
>> +
>>      if (!pdev->romfile) {
>>          return;
>>      }
>
> CC pbonzini,dgilbert,quintela,armbru : guys, is poking at runstate_check like
> this the right way to figure out we are not going to use the
> device locally before incoming migration will overwrite ROM contents?

There is only a way to get into RUN_STATE_INMIGRATE, and that is that we
have started the guest with --incoming <something>.  So the check does
what it is intended.

Once told that, I have never been seen it used for this.
/me launches grep on source tree

At least the block layer and usb use it exactly for this.  So I will say
it is the correct way of doing it (or at least I can think of a better
way right now).

The grep also shows this:

static void rom_reset(void *unused)
{
    Rom *rom;

    QTAILQ_FOREACH(rom, &roms, next) {
        if (rom->fw_file) {
            continue;
        }
        /*
         * We don't need to fill in the RAM with ROM data because we'll fill
         * the data in during the next incoming migration in all cases.  Note
         * that some of those RAMs can actually be modified by the guest.
         */
        if (runstate_check(RUN_STATE_INMIGRATE)) {
            if (rom->data && rom->isrom) {
                /*
                 * Free it so that a rom_reset after migration doesn't
                 * overwrite a potentially modified 'rom'.
                 */
                rom_free_data(rom);
            }
            continue;
        }

It is not exactly the problem at hand, but it is related.  I am just
wondering if we can do something common.

Later, Juan.


