Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7941673BBA
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 15:27:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIVsD-000152-1F; Thu, 19 Jan 2023 09:26:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pIVsB-00013r-9a; Thu, 19 Jan 2023 09:26:35 -0500
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pIVs9-0004Cx-Lu; Thu, 19 Jan 2023 09:26:35 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9DDBA5CECF;
 Thu, 19 Jan 2023 14:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674138391; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D3SrGXQAGdia3Gtgzpgxn1EVA7CxIh05SQOCdS5nkXk=;
 b=rtnsSVeJDfUSxn4Yffdkh4vv38EZndqH6AMXHFO1iSB4cMAxy1JAw5wIxmpklFqATQlNOP
 fS0IhZ4g+hoYR3RTR4uncHrczTf83Z9NKh6P3y/X0xob52N254TDYcITd8067y2IyubcVH
 QoOEgpEseoTKO7cr/1/f36WmISXusnM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674138391;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D3SrGXQAGdia3Gtgzpgxn1EVA7CxIh05SQOCdS5nkXk=;
 b=Ewt5hOnGB50Z43ICiZWl2P6qsr2dHCOdNxdr+zAeQQsi7+80b6E3be6NhrgShzXPJ4yrbP
 kr2sIAnSm9Do6jCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 29E7F139ED;
 Thu, 19 Jan 2023 14:26:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AWDAOBZTyWOhJQAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 19 Jan 2023 14:26:30 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Richard
 Henderson <richard.henderson@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, Claudio
 Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 00/20] target/arm: CONFIG_TCG=n part 1
In-Reply-To: <d8da1d01-c87d-a226-0914-448a7da144c5@linaro.org>
References: <20230118193518.26433-1-farosas@suse.de>
 <39bb348d-e3af-6a20-e7d5-d7a1c918a389@linaro.org> <87bkmu1z8v.fsf@suse.de>
 <d8da1d01-c87d-a226-0914-448a7da144c5@linaro.org>
Date: Thu, 19 Jan 2023 11:26:28 -0300
Message-ID: <877cxi1tyj.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2001:67c:2178:6::1d; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 19/1/23 13:32, Fabiano Rosas wrote:
>> Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:
>>=20
>>> On 18/1/23 20:34, Fabiano Rosas wrote:
>>>> These are the already reviewed patches from the first half of my
>>>> previous series:
>>>> https://lore.kernel.org/r/20230113140419.4013-1-farosas@suse.de
>>>>
>>>> This unbreaks the --disable-tcg build, but there are issues in runtime
>>>> that are still being hashed out in the other series.
>
> Are you saying, we can *link* this configuration but not *run* it yet?

Strictly speaking, we cannot run it. While it works most of the time,
there are still references to machines and cpus that are TCG-only. Try
running -machine ? or -cpu ? for instance. If a user tries to pass one
of those, there might be breakages like the ones you saw.

The other series (I just sent a v4) removes everything that depends on
TCG. Then it will be 100% safe to use --disable-tcg and consume the
result.




