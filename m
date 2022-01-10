Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BEE4899BB
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 14:23:52 +0100 (CET)
Received: from localhost ([::1]:41678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6ueN-0000oy-Vq
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 08:23:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1n6uSO-0000bj-Io
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 08:11:29 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:44543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1n6uSM-0000Af-Rw
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 08:11:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=CkZnpyc5QyxYdVV6UhGbF5mPIdBfTup8EVLpqkxokE8=; b=cZV10fiqYe1ECwmG33ihe0NIS6
 eCzLsIXT6xTGnP2hr8bwHWxSy04uG3aqWlAdzZvPLdX5WYvhUW5n+dlliTTDuP8Kpt7R7rPlFlCCI
 ohK5zY5/rrgnzt6sYJtyAHppnz/Mqw7P749oJvhgsC+YBtB+dz56uvkmVQlKxykdX+7XY8wY+cVNM
 C+hMCR/dhQK/5Glg1Ed9loY//MBe5C7+S+MNRO7HK31TFUTAaeeRPMRqU45RxIajN3ti8yIGQDlTd
 7SJocPCohVfdql+sRlFIY9cpeo+WlMrdiakXpj4TkQVwYupbOyqzSAKMQ8Ihik9pk74HP97RkfncE
 wu84ZxX+nULxdWlot4/DLopLTGBiCanaXCLQPKcG2WE5kodqeRQ5ZdecYvQcyXQf+aa/FjO1N6o/T
 IyTQk3zuHDPcUXRx3RxSs/ngqwt5h/aUTgSMFj1+N0a7bKQVmkDSQhALFZXjaqx/hwf7bl46c9yZV
 uvdum6CtT79KdTIIxhi1XEOBpo3+wGbf/tc5oQE+nwVQlAIz0y6o1DaeBMFvbsnB0bdAJ5UQQBJrR
 7F4rYtL161S72eO6aQN95w0+4LE+YMqQf+N8+CrLJh0mF+pnYQDCZ1HL/pmOGZGi4LzqjhjUTgoE5
 8toL+yyZfrD1rG/ufc4vLdxRLGx1NZe37YnWvqqdc=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Volker =?ISO-8859-1?Q?R=FCmelin?= <vr_qemu@t-online.de>,
 Thomas Huth <huth@tuxfamily.org>, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 00/15] reduce audio playback latency
Date: Mon, 10 Jan 2022 14:11:23 +0100
Message-ID: <3415099.zrPmtJVVhH@silver>
In-Reply-To: <988cdc99-ed34-00cb-bef1-e73b94672a28@t-online.de>
References: <cfcae86f-59c3-a2c5-76cd-1ab5e23e20f3@t-online.de>
 <1981711.luYxhZlUWu@silver>
 <988cdc99-ed34-00cb-bef1-e73b94672a28@t-online.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Sonntag, 9. Januar 2022 18:06:44 CET Volker R=FCmelin wrote:
> > On Donnerstag, 6. Januar 2022 10:21:47 CET Volker R=FCmelin wrote:
> >> This patch series reduces the playback latency for audio backends,
> >> in some cases significantly. For PulseAudio, the audio buffer is
> >> also moved from the QEMU side to the PulseAudio server side. This
> >> improves the drop-out safety for PulseAudio.
> >>=20
> >> I actually measured the latency reduction with the PulseAudio
> >> backend. For the test I used my Linux host configured to play
> >> audio with PulseAudio. The guest was a Linux guest, also
> >> configured to use PulseAudio.
> >=20
> > I haven't reviewed all the patches yet, but from what I read so far, do=
es
> > that mean the additional 3rd buffer is solely for PulseAudio, so for JA=
CK
> > and other backends these changes would overall be a degradation, wouldn=
't
> > they?
> No, nothing changes for JACK and it's an improvement for all the other
> backends where I added a buffer_get_free function. The important changes
> are in [PATCH 10/15] audio: restore mixing-engine playback buffer size.
> That patch tries to keep the mixing-engine buffer empty at the end of
> audio_run_out().
>=20
> I couldn't reduce the playback latency for JACK, because the JACK audio
> buffers are already very small and any further reduction introduces
> playback glitches on my system.

And that's actually my concern. A split 2 buffers -> 3 buffers while=20
(approximately) retaining overall latency increases the chance of dropouts.

> For PulseAudio there is no additional buffer. I only increased the size
> of the server side buffer from 15ms to 46,4ms and added a
> buffer_get_free function. Before this patch series a few ten ms after
> playback started the mixing-engine buffer was full which added 2 *
> 46,4ms to the playback latency. With these patches the mixing-engine
> buffer is empty. This looks like the buffer in use was moved from the
> mixing-engine to the PulseAudio server side.



