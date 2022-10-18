Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F046031E8
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 20:01:12 +0200 (CEST)
Received: from localhost ([::1]:37286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okqtr-0003aq-C2
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 14:01:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1okqoJ-0007yx-HH
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 13:55:27 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:34813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1okqoE-0006s2-4Q
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 13:55:27 -0400
Received: by mail-pf1-x42b.google.com with SMTP id f140so14834622pfa.1
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 10:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Xh0ac7KuHSKKGApLc/V0O+XvL7RyN3FN6qL0h+Jjkms=;
 b=fVSxCrhtkdvOU/yqYoHroed7CbHIqXc5WHSWS3fY3USi0qWy77XoiaAH6g1DLmB0Z4
 8v9c0Mqpa5zwWabEPfVOPbxYctT1qPu2d1ea52LOpusO8QPkahsPeMFZco9dXKb2vJO7
 84ZeuS7Xlgv/jKcz3+0YXjnE0fC6tT5zPTCwYaXhPovAGhCyKtPHlZllu7IXISmRFtFm
 +y/wRmDMoAvyM8ogV4QoZf/F7GR1T6tlFBWfcOghSWqZSFr51353tiblICIVg3PjaHw7
 f0QYqL38WqHwuOLkyPMXCytsT5C14tBeEfzIwnIyc2rltFoyA47M2tlJDhacDVB2dnKo
 85iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Xh0ac7KuHSKKGApLc/V0O+XvL7RyN3FN6qL0h+Jjkms=;
 b=aEWPeoGR5blh1yKpg7OEw9xUlHhuR1mOvIyWjnuWVpNd9FeX1n7SpR2MYbht4Pm2er
 iN+N3//26BhXx2NYeb+cPoK7+S+fwaijCooXnsj2ZZlZxYJ1dgaI2nf3h5Iv7tDUTJSX
 rKikfRbLlrA1i31F3Ms5CW560V403NgD7rE3ebWH2WEDMcOTm8yZl60HESB29uKpStKF
 zsFG2UOaF2rPwIh5o8Ih/DKMU+5sxoCqEothAouDJ1yIIopE8eC65bR++HsDNK39gFbs
 kBbOI0koeyslC9buIsoOqaiP+waO1IHwRr2mC9AoWdLuF6jLTBsKcoaeRtE8+/C+o+da
 UOAw==
X-Gm-Message-State: ACrzQf1miiOQSURbaSidBDatEWqUChNaJ+lwzotubLaJEnbjalL7vD39
 inW/eJLH9F8uFbCT/6vP+4dCfy6VeshAWY7eNZTpveZKgDeNBw==
X-Google-Smtp-Source: AMsMyM4C3SPzy2+kuvMglj7M8s6rEiebV6hitPI7e6fwxXpP63w49lRvblwN7Onm2addJH9pWO6bQ0KdnB4s/Bp52/8=
X-Received: by 2002:a63:9043:0:b0:458:6003:30ee with SMTP id
 a64-20020a639043000000b00458600330eemr3744297pge.231.1666115719884; Tue, 18
 Oct 2022 10:55:19 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Oct 2022 18:55:08 +0100
Message-ID: <CAFEAcA9t7ujfVVOdg4m0PBt1DkYY+UpDr2tA_doEb71+r-gfXA@mail.gmail.com>
Subject: socket chardevs: data loss when other end closes connection?
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I've been looking at a (long-standing) bug where an avocado test
intermittently fails.

This happens because at the avocado end we write "halt\r" to the
serial console, which is wired up to a Unix socket; but at the UART
model we only ever see the 'h' character and no further data.  As far
as I can tell this happens because Avocado closes the socket and the
QEMU socket chardev layer loses the last few characters of data that
the guest hasn't yet read at that point.

This is what seems to me to be going on:
 * Avocado writes the data ('halt\r') and closes the socket
   pretty much immediately afterwards
 * At the glib layer, the socket is polled, and it gets G_IO_IN
   and G_IO_HUP, indicating "readable, and also closed"
 * glib's source dispatch mechanism first calls tcp_chr_read()
   to handle the G_IO_IN part
 * tcp_chr_read() reads a single byte (the 'h'), because
   SocketChardev::max_size is 1 (which in turn is because the
   device model's can_write function returned 1 to say that's
   all it can accept for now). So there's still data to be
   read in future
 * glib now calls tcp_chr_hup() because of the G_IO_HUP (as part
   of the same handle-all-the-sources loop)
 * tcp_chr_hup() calls tcp_chr_disconnect(), which basically
   frees everything, tells the chardev backend that the connection
   just closed, etc
 * the data remaining in the socket to be read after the 'h'
   is never read

How is this intended to work? I guess the socket ought to go
into some kind of "disconnecting" state, but not actually do
a tcp_chr_disconnect() until all the data has been read via
tcp_chr_read() and it's finally got an EOF indication back from
tcp_chr_recv() ?

(The particular avocado test that intermittently fails is:
tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_raspi2_initrd
 -- when this happens, obviously the guest doesn't ever actually
shut down and exit, so the test harness times it out after a while.)

thanks
-- PMM

