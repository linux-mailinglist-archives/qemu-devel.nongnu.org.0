Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB022D8D28
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 14:07:04 +0100 (CET)
Received: from localhost ([::1]:49854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koR5b-0006VL-DA
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 08:07:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1koR2h-0005xt-1o
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 08:04:03 -0500
Received: from mailout12.t-online.de ([194.25.134.22]:42136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1koR2f-0000Gz-EN
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 08:04:02 -0500
Received: from fwd25.aul.t-online.de (fwd25.aul.t-online.de [172.20.26.130])
 by mailout12.t-online.de (Postfix) with SMTP id CABBB41FEEDF;
 Sun, 13 Dec 2020 14:03:56 +0100 (CET)
Received: from [192.168.211.200]
 (VycHfGZ6wh2ZiJ4GeCtW+-PZ6JXv41w92ER4krIhqQCxRnSF-4YlVSXh0LJVEHXQWb@[79.208.17.59])
 by fwd25.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1koR2Y-1alrAO0; Sun, 13 Dec 2020 14:03:54 +0100
To: Gerd Hoffmann <kraxel@redhat.com>
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: [PATCH 0/4] coreaudio bug fix and clean up
Message-ID: <1a970310-4cff-f2f7-985e-05b2f4cd446b@t-online.de>
Date: Sun, 13 Dec 2020 14:03:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ID: VycHfGZ6wh2ZiJ4GeCtW+-PZ6JXv41w92ER4krIhqQCxRnSF-4YlVSXh0LJVEHXQWb
X-TOI-EXPURGATEID: 150726::1607864634-00015F3A-FA2E6FE9/0/0 CLEAN NORMAL
X-TOI-MSGID: 9336224d-4939-44c9-9cb1-dd7c4233105d
Received-SPF: none client-ip=194.25.134.22; envelope-from=vr_qemu@t-online.de;
 helo=mailout12.t-online.de
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_BL_SPAMCOP_NET=1.347, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Howard Spoelstra <hsp.cat7@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix a bug reported on the qemu-discuss mailing list. The error
message was:

coreaudio: Could not lock voice for audioDeviceIOProc
Reason: Invalid argument

While being there, do some clean up.

Howard was kind enough to test the patches.

Volker Rümelin (4):
  coreaudio: rename misnamed variable fake_as
  coreaudio: don't start playback in init routine
  coreaudio: always stop audio playback on shut down
  audio: remove unused function audio_is_cleaning_up()

 audio/audio.c     |  8 -------
 audio/audio.h     |  1 -
 audio/coreaudio.c | 53 +++++++++++++++++------------------------------
 3 files changed, 19 insertions(+), 43 deletions(-)

-- 
2.26.2

