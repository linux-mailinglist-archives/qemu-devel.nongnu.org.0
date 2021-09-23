Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1EF415BF3
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 12:31:03 +0200 (CEST)
Received: from localhost ([::1]:45414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTM0L-0004vy-9k
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 06:31:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mTLy8-0004Du-Ct
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 06:28:44 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:54483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mTLy5-0003Xi-Qa
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 06:28:44 -0400
Received: from [192.168.100.1] ([82.142.21.142]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M1pk0-1mRA6w1Daa-002Izt; Thu, 23 Sep 2021 12:28:38 +0200
Subject: Re: [PATCH v5 04/20] nubus: use bitmap to manage available slots
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20210923091308.13832-1-mark.cave-ayland@ilande.co.uk>
 <20210923091308.13832-5-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <edef53a9-34f5-259c-8aeb-f20aa6177296@vivier.eu>
Date: Thu, 23 Sep 2021 12:28:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210923091308.13832-5-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Ijs2jq36WhV8+VKXFfK7qO6m/A2ouf9HsXa4ur1CgEGr6FbmdtR
 8PblgVctqIClEhReQCXMm+BIUrl9S5grkrw2fzo3PHoNWuoG3B1CmHB+SAzV+SJAHZoQfY2
 GMpE6Fzf7szdDLLOAlfFxEVMZsEVLGHg025VSBOg+uihOWI3JPPqooyB25V/3z2y9H9O4Bb
 5LLz9JyNaycPVgO98PwhQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:qAalHqbigdM=:O+3dK7As0dIU2dIS17a0Ey
 cUlonpUPwc1sICpH54IIiDhDjQ/zO2T3pCQs9Z/kOzdtDZ+pWxJB+lmUwKHvc8GKV29DzDoNn
 +HRBi95HDeaur3vukQ3BdZKF8mL/LTzscgf4xI7Kcy7aGW22YLolgR7MS8FYrsKZK2i71q/lg
 9680ikw0a4+soC8wOYjHAgG4TodnNdGN5ucA/yLCZO0q3mkVROpejr3aF31mVxo8KVcfmk1uo
 b5Cj0XqUIhQ0q79B7BoBCPIB7GDaL/TSzCbtmApBu0aUq1pQLq30b/UhGuvnJAAzJ/WgklZyu
 i5qNgLlxbNcF7BNQBDRSjrjMrQdTGcMkTwDtnJ+Dy6w7NO6E4BCp2Ah5CxlGM+Mh8ThyQ4SG7
 uudeWOGk0Pu+M5gzvSew7+KDqECswEPDhhzpNEvm3BJgjap8GpSKxSvXDDYz6jGWVg2yCmjDG
 dExnHgNybeL/TGoZb+MPqmR56K+qBtFku4ZNktUMZ7VawCEXlkxYijpT+MEanaXrCZfRGwZNr
 A0NBWQWKidv93ES438LYsG5UzAOAjo9AgsXEIe1jyb0UErhkeSc/w5SI+k9fa8QwSiSCCECAB
 3rUQ+gCQGcB9zUFZWsjYgfzdO6p62NFuH8MEN7uc9MSBQwATmp7UyDapZqH+HwukvuIfPr359
 NSZ4f6mDsY2Sd1GSLt3GsRlu0LbYgmuYswetMRBNPPGSOlttta7qd8HmbGifeC1642j8F3ZrD
 PV23MYyJ5zg1HZDjI78UIRBSR7kcctOLRXD8Sw==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 23/09/2021 à 11:12, Mark Cave-Ayland a écrit :
> Convert nubus_device_realize() to use a bitmap to manage available slots to allow
> for future Nubus devices to be plugged into arbitrary slots from the command line
> using a new qdev "slot" parameter for nubus devices.
> 
> Update mac_nubus_bridge_init() to only allow slots 0x9 to 0xe on a Macintosh
> machines as documented in "Desigining Cards and Drivers for the Macintosh Family".
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/nubus/mac-nubus-bridge.c         |  4 ++++
>  hw/nubus/nubus-bus.c                |  5 +++--
>  hw/nubus/nubus-device.c             | 32 +++++++++++++++++++++++------
>  include/hw/nubus/mac-nubus-bridge.h |  4 ++++
>  include/hw/nubus/nubus.h            | 13 ++++++------
>  5 files changed, 43 insertions(+), 15 deletions(-)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


