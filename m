Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E4830BE37
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 13:32:40 +0100 (CET)
Received: from localhost ([::1]:41148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6urH-0006VY-Mw
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 07:32:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1l6uqA-0005jP-G9
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 07:31:30 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:26962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1l6uq7-0001iD-7d
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 07:31:29 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 573957462E1;
 Tue,  2 Feb 2021 13:31:23 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 2175B7462BD; Tue,  2 Feb 2021 13:31:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 1F6407462DB;
 Tue,  2 Feb 2021 13:31:23 +0100 (CET)
Date: Tue, 2 Feb 2021 13:31:23 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: vnc clipboard support
In-Reply-To: <20210202113144.jrmqtgllpgd2nw2h@sirius.home.kraxel.org>
Message-ID: <e3598537-86af-6cf7-bdfe-eac43bce0f2@eik.bme.hu>
References: <20210129110814.GF4001740@redhat.com>
 <0F802343-19F8-487C-8BBE-5BBE2014BA1C@redhat.com>
 <20210129143252.GE4008275@redhat.com>
 <05C58667-D9BA-49E2-897D-2286B243E802@redhat.com>
 <20210201155116.GL4131462@redhat.com>
 <0C14700F-CF47-4CD1-AB41-AA69BC0DA469@redhat.com>
 <20210201165634.GM4131462@redhat.com>
 <D704948F-96C7-441F-BCA3-F848ABFD8087@redhat.com>
 <20210201174018.GP4131462@redhat.com>
 <8456ae54-b737-fa7d-cac8-75cd701f9ef5@eik.bme.hu>
 <20210202113144.jrmqtgllpgd2nw2h@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?ISO-8859-15?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>,
 Christophe de Dinechin <cdupontd@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2 Feb 2021, Gerd Hoffmann wrote:
>>> My preferred solution is to have QEMU leverage the existing SPICE
>>> guest agent if at all possible, because that's already widely
>>> available in existing guest OS.
>>
>> I think spice is not as widely available as VNC (or even Synergy) so the
>> idea to strip one of those down to just a guest clipboard agent would help
>> to get support to the most guests.
>
> Well, we can use the spice agent as-is, then just let it talk to qemu
> instead of spice client.  No need to code anything on the guest side,
> and the (guest) code packaged up in distros will just work.
>
>> QEMU already knows about VNC so might be the simplest way and you
>> could reuse all kinds of VNC client and server code for the guest
>> agent and also make it easy for others to add support for their
>> guests.
>
> Something vnc-ish doesn't look like a good plan to me.  When coding up
> something new I'd go model the protocol after something more modern like
> wayland.  When reusing something existing the spice-agent protocol looks
> best as most existing linux guests already support it.

Is there anything the vnc protocol lacks over more modern ones that would 
be needed? I don't know what wayland does. Just because vnc is old it 
could be sufficient but I have no strong preference for any of these, just 
wanted to say that reusing something that's available on the most guests 
would make it work for most people with the least effort and vnc is quite 
widely available.

> Also note that we can hook up clipboard support for the other UIs too
> once we have the infrastructure in qemu, so even though there is "vnc"
> in the subject line this isn't about vnc only.

OK in that case using vnc protocol over others would not make it easier to 
connect to the server side but probably would not mmake it harder either.

>> Using spice may not be that easi as it's less widespread so probably
>> only works on the guests that already have support for it. And then
>> why not just use spice instead of VNC on those guests and then you
>> don't have the clipboard problem either.
>
> The guest side is easy.  The spice-vdagent package is small, and the
> dependencies it needs are most likely present anyway in a guest with
> a graphical desktop installed.
>
> The host side is a bit more tricky.  spice-server has a relatively long
> list of dependencies not needed otherwise on a virtualization host.
>
>>> We need something to be running in the guest, and that should be
>>> agnostic of whatever other software the guest chooses to use for
>>> remote desktop, and should not assume the guest even has remote
>>> desktop setup.
>>
>> As I understood, the idea is not to run a full VNC server on the guest OS
>> but to make it easy to write the guest agent that you'll need to run is to
>> reuse parts of a VNC server which is already available on almost all
>> platforms.
>
> spice guest agent is already available for linux and windows.  Not fully
> sure how the state is on other unix-ish platforms like *bsd is.  In any
> case it should not be that hard to port the linux version over.

You scope of possible guests seem to be limited, there are much more that 
can run on QEMU. What about macOS/X, MacOS, MorphOS, etc. OK they are not 
big and may be niche but people I know would like to use clipboard with 
those too. MorphOS has VNC server and Synergy client but not sure it would 
have dependencies for spice agent which is of course not as readily 
available on most platforms as e.g. vnc is. If we plan to allow such 
guests to use this clipboard solution then a protocol that's easy to 
implement without too much dependencies would be best. One which is aleady 
available is even better.

Regards,
BALATON ZOltan

