Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EFC60BC25
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 23:28:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on47Y-0005ke-Dh; Mon, 24 Oct 2022 16:32:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1on47M-0005iO-Kh
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 16:32:18 -0400
Received: from mailout05.t-online.de ([194.25.134.82])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1on46t-0004Rt-JK
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 16:31:49 -0400
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
 by mailout05.t-online.de (Postfix) with SMTP id 9BAF51C6F3;
 Mon, 24 Oct 2022 22:31:42 +0200 (CEST)
Received: from [192.168.211.200] ([84.175.228.229]) by fwd71.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1on46o-0uqzwX0; Mon, 24 Oct 2022 22:31:42 +0200
Message-ID: <b3c5e4b6-0208-0b0d-fef4-b536ce889dfc@t-online.de>
Date: Mon, 24 Oct 2022 22:31:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH] tests/qtest/ac97-test: add up-/downsampling tests
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
References: <20221022160052.1132-1-vr_qemu@t-online.de>
 <CAJ+F1CLjiCs4zSxSpr_OPWDM9_xCC0YfJTL_82umDB-rX6aW3Q@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAJ+F1CLjiCs4zSxSpr_OPWDM9_xCC0YfJTL_82umDB-rX6aW3Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1666643502-F2FF5ECF-467FE97A/0/0 CLEAN NORMAL
X-TOI-MSGID: 9966d916-8530-4777-a9d7-1f55129cab78
Received-SPF: none client-ip=194.25.134.82; envelope-from=vr_qemu@t-online.de;
 helo=mailout05.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 24.10.22 um 10:13 schrieb Marc-André Lureau:
> Hi
>
> On Mon, Oct 24, 2022 at 9:28 AM Volker Rümelin <vr_qemu@t-online.de> 
> wrote:
>
>     Test if the audio subsystem can handle extreme up- and down-
>     sampling ratios like 44100/1 and 1/44100. For some time these
>     used to trigger QEMU aborts. The test was taken from
>     https://gitlab.com/qemu-project/qemu/-/issues/71 where it was
>     used to demonstrate a very different issue.
>
>     Suggested-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>     Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
>
>
> Thanks for working on this
>
> It seems to show something different though:
> "
> A bug was just triggered in audio_calloc
> Save all your work and restart without audio
> I am sorry
> "
>
> AUD_open_out() is called with audsettings: {freq = 1, nchannels = 2, 
> fmt = AUDIO_FORMAT_S16, endianness = 0}
>
> And that's it. Any idea?

Hi,

the scary message is expected and doesn't mean this qos-test failed. 
This is the currently not so silent 'the audio subsystem should (...) 
silently give up' case.

The noaudio backend uses a mixing-engine buffer size of 1024 audio 
frames and AUD_open_* tries to allocate memory for 1024/44100 = 0.0232 
audio frames for the resample buffer in audio_pcm_sw_alloc_resources_*. 
This allocation fails and produces the scary message. The error is 
handled correctly and AUD_open_* returns NULL. AUD_read and AUD_write 
return early if this pointer is NULL and the audio frontend callback 
functions will also not be called because the audio_frontend_frames_* 
functions return 0 in this case.

If you would like to see the two tests fail, revert commit 0cbc8bd469 
("audio: remove abort() in audio_bug()") and rerun qos-test.

With best regards,
Volker

>
>
>     ---
>      tests/qtest/ac97-test.c | 40 +++++++++++++++++++++++++++++++++++++++-
>      1 file changed, 39 insertions(+), 1 deletion(-)
>
>     diff --git a/tests/qtest/ac97-test.c b/tests/qtest/ac97-test.c
>     index 74103efdfa..ce25f1d588 100644
>     --- a/tests/qtest/ac97-test.c
>     +++ b/tests/qtest/ac97-test.c
>     @@ -42,16 +42,54 @@ static void *ac97_create(void *pci_bus,
>     QGuestAllocator *alloc, void *addr)
>          return &ac97->obj;
>      }
>
>     +/*
>     + * This is rather a test of the audio subsystem and not an AC97
>     test. Test if
>     + * the audio subsystem can handle a 44100/1 upsample ratio. With
>     an audio
>     + * mixing buffer size of 1024 audio frames, the audio subsystem
>     should either
>     + * generate 1024 output frames from 0.0232 input frames or
>     silently give up.
>     + */
>     +static void ac97_playback_upsample(void *obj, void *data,
>     QGuestAllocator *alloc)
>     +{
>     +    QAC97 *ac97 = obj;
>     +    QPCIDevice *dev = &ac97->dev;
>     +    QPCIBar bar0;
>     +
>     +    qpci_device_enable(dev);
>     +    bar0 = qpci_iomap(dev, 0, NULL);
>     +    qpci_io_writew(dev, bar0, 0x2c, 0x1);
>     +}
>     +
>     +/*
>     + * This test is similar to the playback upsample test. This time
>     the audio
>     + * subsystem should either generate 0.0232 audio frames from 1024
>     input frames
>     + * or silently give up.
>     + */
>     +static void ac97_record_downsample(void *obj, void *data,
>     QGuestAllocator *alloc)
>     +{
>     +    QAC97 *ac97 = obj;
>     +    QPCIDevice *dev = &ac97->dev;
>     +    QPCIBar bar0;
>     +
>     +    qpci_device_enable(dev);
>     +    bar0 = qpci_iomap(dev, 0, NULL);
>     +    qpci_io_writew(dev, bar0, 0x32, 0x1);
>     +}
>     +
>      static void ac97_register_nodes(void)
>      {
>          QOSGraphEdgeOptions opts = {
>     -        .extra_device_opts = "addr=04.0",
>     +        .extra_device_opts = "addr=04.0,audiodev=snd0",
>     +        .after_cmd_line = "-audiodev none,id=snd0"
>     + ",out.frequency=44100,in.frequency=44100",
>          };
>          add_qpci_address(&opts, &(QPCIAddress) { .devfn =
>     QPCI_DEVFN(4, 0) });
>
>          qos_node_create_driver("AC97", ac97_create);
>          qos_node_produces("AC97", "pci-device");
>          qos_node_consumes("AC97", "pci-bus", &opts);
>     +
>     +    qos_add_test("playback_upsample", "AC97",
>     ac97_playback_upsample, NULL);
>     +    qos_add_test("record_downsample", "AC97",
>     ac97_record_downsample, NULL);
>      }
>
>      libqos_init(ac97_register_nodes);
>     -- 
>     2.35.3
>
>
>
>
> -- 
> Marc-André Lureau


