Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 385BE6A6136
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 22:25:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX7Sw-0003fG-Dr; Tue, 28 Feb 2023 16:24:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@maciej.szmigiero.name>)
 id 1pX7Su-0003de-7G
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 16:24:52 -0500
Received: from vps-vb.mhejs.net ([37.28.154.113])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@maciej.szmigiero.name>)
 id 1pX7Ss-00069K-7t
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 16:24:51 -0500
Received: from MUA by vps-vb.mhejs.net with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <mail@maciej.szmigiero.name>)
 id 1pX7Sg-0004Xa-If; Tue, 28 Feb 2023 22:24:38 +0100
Message-ID: <608fcc8e-cd8c-2646-527d-420a3b04cfc9@maciej.szmigiero.name>
Date: Tue, 28 Feb 2023 22:24:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US, pl-PL
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S . Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <cover.1677274611.git.maciej.szmigiero@oracle.com>
 <4c4fe768b5457f8e6c17dcea7656cbe017c9a4df.1677274611.git.maciej.szmigiero@oracle.com>
 <Y/47QC6F/bPNgFOx@redhat.com>
From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Subject: Re: [PATCH][RESEND v3 3/3] Add a Hyper-V Dynamic Memory Protocol
 driver (hv-balloon)
In-Reply-To: <Y/47QC6F/bPNgFOx@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.28.154.113;
 envelope-from=mail@maciej.szmigiero.name; helo=vps-vb.mhejs.net
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.092,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 28.02.2023 18:34, Daniel P. Berrangé wrote:
> On Fri, Feb 24, 2023 at 10:41:16PM +0100, Maciej S. Szmigiero wrote:
> 
>> Hot-adding additional memory is done by creating a new memory backend (for
>> example by executing HMP command
>> "object_add memory-backend-ram,id=mem1,size=4G"), then executing a new
>> "hv-balloon-add-memory" QMP command, providing the id of that memory
>> backend as the "id" parameter.
> 
> [snip]
> 
>> After a VM reboot each previously hot-added memory backend gets released.
>> A "HV_BALLOON_MEMORY_BACKEND_UNUSED" QMP event is emitted in this case so
>> the software controlling QEMU knows that it either needs to delete that
>> memory backend (if no longer needed) or re-insert it.
> 
> IIUC you're saying that the 'hv-balloon-add-memory' command needs
> to be re-run after a guest reset ?

Yes.

> If so I feel that is a rather> undesirable job to punt over the mgmt app. The 'reset' event can
> be missed if the mgmt app happend to be restarting and reconnecting
> to existing running QMP console.

See the answer below the next paragraph.

>> In the future, the guest boot memory size might be changed on reboot
>> instead, taking into account the effective size that VM had before that
>> reboot (much like Hyper-V does).
> 
> Is that difficult to do right now ?  It isn't too nice to make the
> mgmt apps implement the workaround now if we're going to make it
> redundant later.

The v1 of this driver did re-add memory backends automatically after
a reboot, so if that's something that is desirable it can be re-introduced
without much difficulty.

The issue here is that the guest might never re-connect to the DM protocol
interface after a reboot (perhaps because the VM was rebooted from
a Windows to a Linux guest).
In this case the driver would wait endlessly, not letting the
underlying memory backends to be removed.

virtio-mem also seems to unplug all blocks unconditionally when the VM is
rebooted.

On the other hand, actually resizing the guest boot memory is definitely
not trivial - for sure that's something for future work
(virtio-mem might also benefit from it).

>> The above design results in much better ballooning performance than when
>> using virtio-balloon with the same guest: 230 GB / minute with this driver
>> versus 70 GB / minute with virtio-balloon.
> 
> snip
> 
>> The unballoon operation is also pretty much instantaneous:
>> thanks to the merging of the ballooned out page ranges 200 GB of memory can
>> be returned to the guest in about 1 second.
>> With virtio-balloon this operation takes about 2.5 minutes.
> 
> That's pretty impressive !

Thanks!

>> These tests were done against a Windows Server 2019 guest running on a
>> Xeon E5-2699, after dirtying the whole memory inside guest before each
>> balloon operation.
> 
> 
> 
>> Since the required GTree operations aren't present in every Glib version
>> a check for them was added to "configure" script, together with new
>> "--enable-hv-balloon" and "--disable-hv-balloon" arguments.
>> If these GTree operations are missing in the system's Glib version this
>> driver will be skipped during QEMU build.
> 
> Funnily enough there's a patch posted recently that imports the glib
> GTree impl into QEMU calling it QTree. This was to workaround a problem
> with GSlice not being async signal safe, but if we take that patch, then
> you wouldn't need to skip the build you could rely on this in-tree copy
> instead.
> 
> https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg01225.html

Thanks for the pointer, however the {G,Q}Tree import explicitly excludes
these tree operations that this driver needs (as they currently don't
have any callers in QEMU).

So in this case either they would have to be imported too or the driver
would need QEMU being built with the upstream Glib (as far as I can see,
[1] says this will still be possible with glib >= 2.76.0).

Thanks,
Maciej

[1]: https://gitlab.com/qemu-project/qemu/-/issues/285


