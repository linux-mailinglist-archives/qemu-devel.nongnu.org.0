Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C667F6F43C0
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 14:24:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptp3F-00007s-OV; Tue, 02 May 2023 08:24:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1ptp2Y-0007eH-D1; Tue, 02 May 2023 08:23:31 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1ptp2U-0007Sj-FY; Tue, 02 May 2023 08:23:29 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8C8C321E55;
 Tue,  2 May 2023 12:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1683030203; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nRzSTciWut3U5vtSMhzKMhx5dkbc8jv3YATx12wbozM=;
 b=0eJien0mrtsua8yQ28VQlB6E+IS20mUSsJyLuxIDmZuoN6a5bpejqwXRvSJ9wNoWixcLvs
 Y5y7Ge2QibfGvwd91BJloY5XIrery9nbFxBWMgoPCrt6Kw0Dm8EvXrLdDPF/Kc/2HWhNID
 Jrj4YOOQ4NBSBcwBBMoJjXlD/37VVx0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1683030203;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nRzSTciWut3U5vtSMhzKMhx5dkbc8jv3YATx12wbozM=;
 b=r72wTQ6m4WLVfzQ2i8rpSHd45Z4MbO0gHfR5P+IlO4x88LFRf50DAGKDKds0pN2Mht/t0N
 GT9jN2t8p+RO8YAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 18EB4139C3;
 Tue,  2 May 2023 12:23:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id c47PNLoAUWQ1NwAAMHmgww
 (envelope-from <farosas@suse.de>); Tue, 02 May 2023 12:23:22 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Richard
 Henderson <richard.henderson@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, Claudio
 Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v11 04/13] target/arm: Do not expose all -cpu max
 features to qtests
In-Reply-To: <2270f306-5857-5f17-f8e1-fe2f15151da0@linaro.org>
References: <20230426180013.14814-1-farosas@suse.de>
 <20230426180013.14814-5-farosas@suse.de>
 <2270f306-5857-5f17-f8e1-fe2f15151da0@linaro.org>
Date: Tue, 02 May 2023 09:23:20 -0300
Message-ID: <87y1m6j51j.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2001:67c:2178:6::1c; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 26/4/23 20:00, Fabiano Rosas wrote:
>> We're about to move the TCG-only -cpu max configuration code under
>> CONFIG_TCG. To be able to do that we need to make sure the qtests
>> still have some cpu configured even when no other accelerator is
>> available.
>>=20
>> Delineate now what is used with TCG-only and what is also used with
>> qtests to make the subsequent patches cleaner.
>>=20
>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>> ---
>>   target/arm/cpu64.c | 12 +++++++++---
>>   1 file changed, 9 insertions(+), 3 deletions(-)
>
> https://lore.kernel.org/qemu-devel/ae65d59f-5e16-24bb-aece-ccdd504fe75e@l=
inaro.org/
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>
> https://lore.kernel.org/qemu-devel/4d744ee9-372b-c1f1-0d0f-be06b4b63c6f@l=
inaro.org/
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Ah, thank you! The 'b4 trailers' must have failed and I didn't notice.

