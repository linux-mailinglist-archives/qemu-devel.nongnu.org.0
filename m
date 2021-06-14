Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 605263A6481
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 13:24:11 +0200 (CEST)
Received: from localhost ([::1]:40914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lskhO-0004zx-Eo
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 07:24:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lskgY-0004A9-Ou; Mon, 14 Jun 2021 07:23:18 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:46914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lskgV-0004U9-L6; Mon, 14 Jun 2021 07:23:18 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 491D521984;
 Mon, 14 Jun 2021 11:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623669793; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tKpGDPc3fu1aDwuEN1tO5oU0y/sg2Ct5QttyErk4Yoo=;
 b=r5xl1y86ui2fCaiypR06TMx3bAbOcqQEQs/CEjtjwBvSp+LPxKLaAgD+3brZZyViD2HyDb
 klbSi99/WyuUSARdrZtcsAAT8qpZCBzPZXMk5r2IZI4DSaXALD+644m+tLvuDpCzlC8Ojx
 pLeizzqRNRLo0jCgDSIQ7NjpxDuHvj8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623669793;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tKpGDPc3fu1aDwuEN1tO5oU0y/sg2Ct5QttyErk4Yoo=;
 b=z+IQSsaGiQ6a6BLTnh/wX5x9u0aD4nyH1sYEq0QDjOxrDuJIFFUcXbilxB5gUFRLWX+x5t
 yt4qHn9PTQyP8RAA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 98708118DD;
 Mon, 14 Jun 2021 11:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623669793; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tKpGDPc3fu1aDwuEN1tO5oU0y/sg2Ct5QttyErk4Yoo=;
 b=r5xl1y86ui2fCaiypR06TMx3bAbOcqQEQs/CEjtjwBvSp+LPxKLaAgD+3brZZyViD2HyDb
 klbSi99/WyuUSARdrZtcsAAT8qpZCBzPZXMk5r2IZI4DSaXALD+644m+tLvuDpCzlC8Ojx
 pLeizzqRNRLo0jCgDSIQ7NjpxDuHvj8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623669793;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tKpGDPc3fu1aDwuEN1tO5oU0y/sg2Ct5QttyErk4Yoo=;
 b=z+IQSsaGiQ6a6BLTnh/wX5x9u0aD4nyH1sYEq0QDjOxrDuJIFFUcXbilxB5gUFRLWX+x5t
 yt4qHn9PTQyP8RAA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id FxueIyA8x2BvDwAALh3uQQ
 (envelope-from <cfontana@suse.de>); Mon, 14 Jun 2021 11:23:12 +0000
Subject: Re: [PATCH v2 17/18] modules: check arch and block load on mismatch
To: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210610055755.538119-1-kraxel@redhat.com>
 <20210610055755.538119-18-kraxel@redhat.com> <YMIHDKEGQWKtwEU5@redhat.com>
 <20210610125721.b27j6raf4h3qujt3@sirius.home.kraxel.org>
 <YMIOQNXkOoFekp8p@redhat.com>
 <20210610140354.egrgtwa5r5yxei3f@sirius.home.kraxel.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <b3d35127-6ef3-2e2e-0341-a0076a499559@suse.de>
Date: Mon, 14 Jun 2021 13:23:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210610140354.egrgtwa5r5yxei3f@sirius.home.kraxel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.489,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Lieven <pl@kamp.de>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/10/21 4:03 PM, Gerd Hoffmann wrote:
>   Hi,
> 
>> Is the JSON file completely static, listing all modules that were built
>> regardless of whether they are currently installed, or would it need to
>> be refreshed when installing/uninstalling RPMs with modules ? I would
>> think we can do the former and simply handle missing modules on disk
>> fairly easily
> 
> We can do both.  The file is generated and installed as part of the
> build/install process, and it can be simply used as-is even if some of
> the modules are missing.
> 
> It's also possible to update the modinfo.json file in postinstall /
> postuninstall by simply running qemu-modinfo, so only the modules
> actually installed are listed there.
> 
> take care,
>   Gerd
> 
> 

I fail to see why that extra complication is needed at all.

Why don't we just build the modules for the targets we intend to build,
and install them as .so files in a target arch directory?

What problem is the json solving? Sorry if obvious.

Thanks,

Claudio  


