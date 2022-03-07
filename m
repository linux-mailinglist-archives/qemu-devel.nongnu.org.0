Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 111574CFF0D
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 13:45:23 +0100 (CET)
Received: from localhost ([::1]:50642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRCjp-0000MH-Nx
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 07:45:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1nRCRJ-0004a5-Mi
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 07:26:14 -0500
Received: from smtp-out2.suse.de ([195.135.220.29]:49088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1nRCRH-0001Vf-Ut
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 07:26:13 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DAA721F37D;
 Mon,  7 Mar 2022 12:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1646655969; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QkbaPkm0xBL9xKX7/S+Tfo11v5tUI4LRdavknwmY5ic=;
 b=Dn8KSXnJDo19einWChGlYhVzkE8uPOIWJwJnIYar1cwRqJO+m3d2R2x1h3WTroFlrt/+rH
 +5DcmH5nVybbassQOO9kyEhZKk4KoNPAU2uCR5hrT8yskYFb+X8kjwt2JZ4UBO97NS/IYp
 40i2YwmRgUL2eaHFKAeALpjFlBGaEyE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1646655969;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QkbaPkm0xBL9xKX7/S+Tfo11v5tUI4LRdavknwmY5ic=;
 b=dj4ae9yczWEAjRxZiCrSMacIfmNEP49gxwoJ1+uDEOnXtUuFE/YnO0qjq/0NsVInDPz9mU
 wwQpKGS3ad37aiCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B2F2613AD8;
 Mon,  7 Mar 2022 12:26:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2nb3KeH5JWLAaAAAMHmgww
 (envelope-from <cfontana@suse.de>); Mon, 07 Mar 2022 12:26:09 +0000
Subject: Re: starting to look at qemu savevm performance, a first regression
 detected
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <8826b03d-e5e9-0e65-cab7-ea1829f48e6c@suse.de>
 <YiXQHIWtHx5BocxK@redhat.com> <62ba8b1e-d641-5b10-c1b3-54b7d5a652e7@suse.de>
 <YiXVh1P4oJNuEtFM@redhat.com> <1f70a086-2b72-bd83-414b-476f5e6d0094@suse.de>
 <YiXzw8pF9If2/M7M@redhat.com> <5f318297-51c0-366b-758b-733ba27684ba@suse.de>
 <YiX4gfBtgDq/uZpu@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <5b3d17d2-f07f-8cb1-54ff-6a517dc4eaef@suse.de>
Date: Mon, 7 Mar 2022 13:26:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <YiX4gfBtgDq/uZpu@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/7/22 1:20 PM, Daniel P. Berrangé wrote:
> On Mon, Mar 07, 2022 at 01:09:55PM +0100, Claudio Fontana wrote:
>> On 3/7/22 1:00 PM, Daniel P. Berrangé wrote:
>>> On Mon, Mar 07, 2022 at 12:19:22PM +0100, Claudio Fontana wrote:
>>>> On 3/7/22 10:51 AM, Daniel P. Berrangé wrote:
>>>>> On Mon, Mar 07, 2022 at 10:44:56AM +0100, Claudio Fontana wrote:
>>>>>> Hello Daniel,
>>>>>>
>>>>>> On 3/7/22 10:27 AM, Daniel P. Berrangé wrote:
>>>>>>> On Sat, Mar 05, 2022 at 02:19:39PM +0100, Claudio Fontana wrote:
>>>>>>>>
>>>>>>>> Hello all,
>>>>>>>>
>>>>>>>> I have been looking at some reports of bad qemu savevm performance in large VMs (around 20+ Gb),
>>>>>>>> when used in libvirt commands like:
>>>>>>>>
>>>>>>>>
>>>>>>>> virsh save domain /dev/null
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>> I have written a simple test to run in a Linux centos7-minimal-2009 guest, which allocates and touches 20G mem.
>>>>>>>>
>>>>>>>> With any qemu version since around 2020, I am not seeing more than 580 Mb/Sec even in the most ideal of situations.
>>>>>>>>
>>>>>>>> This drops to around 122 Mb/sec after commit: cbde7be900d2a2279cbc4becb91d1ddd6a014def .
>>>>>>>>
>>>>>>>> Here is the bisection for this particular drop in throughput:
>>>>>>>>
>>>>>>>> commit cbde7be900d2a2279cbc4becb91d1ddd6a014def (HEAD, refs/bisect/bad)
>>>>>>>> Author: Daniel P. Berrangé <berrange@redhat.com>
>>>>>>>> Date:   Fri Feb 19 18:40:12 2021 +0000
>>>>>>>>
>>>>>>>>     migrate: remove QMP/HMP commands for speed, downtime and cache size
>>>>>>>>     
>>>>>>>>     The generic 'migrate_set_parameters' command handle all types of param.
>>>>>>>>     
>>>>>>>>     Only the QMP commands were documented in the deprecations page, but the
>>>>>>>>     rationale for deprecating applies equally to HMP, and the replacements
>>>>>>>>     exist. Furthermore the HMP commands are just shims to the QMP commands,
>>>>>>>>     so removing the latter breaks the former unless they get re-implemented.
>>>>>>>>     
>>>>>>>>     Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>>>>>>>>     Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
>>>>>>>
>>>>>>> That doesn't make a whole lot of sense as a bisect result.
>>>>>>> How reliable is that bisect end point ? Have you bisected
>>>>>>> to that point more than once ?
>>>>>>
>>>>>> I did run through the bisect itself only once, so I'll double check that.
>>>>>> The results seem to be reproducible almost to the second though, a savevm that took 35 seconds before the commit takes 2m 48 seconds after.
>>>>>>
>>>>>> For this test I am using libvirt v6.0.0.
>>>
>>> I've just noticed this.  That version of libvirt is 2 years old and
>>> doesn't have full support for migrate_set_parameters.
>>>
>>>
>>>> 2022-03-07 10:47:20.145+0000: 134386: info : qemuMonitorIOWrite:452 : QEMU_MONITOR_IO_WRITE: mon=0x7fa4380028a0 buf={"execute":"migrate_set_speed","arguments":{"value":9223372036853727232},"id":"libvirt-19"}^M
>>>>  len=93 ret=93 errno=0
>>>> 2022-03-07 10:47:20.146+0000: 134386: info : qemuMonitorJSONIOProcessLine:240 : QEMU_MONITOR_RECV_REPLY: mon=0x7fa4380028a0 reply={"id": "libvirt-19", "error": {"class": "CommandNotFound", "desc": "The command migrate_set_speed has not been found"}}
>>>> 2022-03-07 10:47:20.147+0000: 134391: error : qemuMonitorJSONCheckError:412 : internal error: unable to execute QEMU command 'migrate_set_speed': The command migrate_set_speed has not been found
>>>
>>> We see the migrate_set_speed failing and libvirt obviously ignores that
>>> failure.
>>>
>>> In current libvirt migrate_set_speed is not used as it properly
>>> handles migrate_set_parameters AFAICT.
>>>
>>> I think you just need to upgrade libvirt if you want to use this
>>> newer QEMU version
>>>
>>> Regards,
>>> Daniel
>>>
>>
>> Got it, this explains it, sorry for the noise on this.
>>
>> I'll continue to investigate the general issue of low throughput with virsh save / qemu savevm .
> 
> BTW, consider measuring with the --bypass-cache flag to virsh save.
> This causes libvirt to use a I/O helper that uses O_DIRECT when
> saving the image. This should give more predictable results by
> avoiding the influence of host I/O cache which can be in a differnt
> state of usage each time you measure.  It was also intended that
> by avoiding hitting cache, saving the memory image of a large VM
> will not push other useful stuff out of host I/O  cache which can
> negatively impact other running VMs.
> 
> Also it is possible to configure compression on the libvirt side
> which may be useful if you have spare CPU cycles, but your storage
> is slow. See 'save_image_format' in the /etc/libvirt/qemu.conf
> 
> With regards,
> Daniel
> 

Hi Daniel, thanks for these good info,

regarding slow storage, for these tests I am saving to /dev/null to avoid having to take storage into account
(and still getting low bandwidth unfortunately) so I guess compression is out of the question.

Thanks!

Claudio

