Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC363C2027
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 09:45:27 +0200 (CEST)
Received: from localhost ([::1]:51016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1lCQ-0002xj-44
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 03:45:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1m1lBG-0002EH-Um
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 03:44:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1m1lBD-0004j3-El
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 03:44:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625816650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AM37ZStCPszT88lMNqe4SzwqDKQdRV0udd42AUKTbUY=;
 b=BmdnkfcIlCRWylwaNeyMKmApiRH73sBYU+Qozg5h9Yxu5IvhmSL5cfGZvichRxeiLblecE
 2iVc/DXyoh/oc95FEWng0o3kZscqajxvGHcYvuGfd+ZLKAnZFKrhATgBay2PYKi8I6WE9/
 lI+n+W7gHWFDiw+yw10AY309HZesEn4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-BdH_iTcNOvK1KMiYfCSZ4Q-1; Fri, 09 Jul 2021 03:44:07 -0400
X-MC-Unique: BdH_iTcNOvK1KMiYfCSZ4Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1A7FC7441;
 Fri,  9 Jul 2021 07:44:05 +0000 (UTC)
Received: from localhost (ovpn-113-97.ams2.redhat.com [10.36.113.97])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 52DEF189C7;
 Fri,  9 Jul 2021 07:44:02 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Al Cho <ACho@suse.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>
Subject: Re: [PATCH v7 01/14] target/s390x: meson: add target_user_arch
In-Reply-To: <7be24c318aed9e762360a00a75340939568b3dea.camel@suse.com>
Organization: Red Hat GmbH
References: <20210707105324.23400-1-acho@suse.com>
 <20210707105324.23400-2-acho@suse.com> <871r88g1ti.fsf@redhat.com>
 <7be24c318aed9e762360a00a75340939568b3dea.camel@suse.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Fri, 09 Jul 2021 09:43:56 +0200
Message-ID: <87y2agdj9f.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Claudio Fontana <Claudio.Fontana@suse.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "cfontana@suse.de" <cfontana@suse.de>,
 =?utf-8?Q?Jos=C3=A9?= Ricardo Ziviani <jose.ziviani@suse.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 09 2021, Al Cho <ACho@suse.com> wrote:

> On Thu, 2021-07-08 at 19:20 +0200, Cornelia Huck wrote:
>> On Wed, Jul 07 2021, "Cho, Yu-Chen" <acho@suse.com> wrote:
>>=20
>> > the lack of target_user_arch makes it hard to fully leverage the
>> > build system in order to separate user code from sysemu code.
>> >=20
>> > Provide it, so that we can avoid the proliferation of #ifdef
>> > in target code.
>> >=20
>> > Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> > Signed-off-by: Cho, Yu-Chen <acho@suse.com>
>>=20
>> Just noticed when I was sending a pull request: your unquoted name in
>> the s-o-b confuses git send-email when it is doing its automatic cc:s
>> (it adds a 'cc:Cho', which is obviously bogus and leads to the mail
>> being rejected by the list server.) Not sure whether git send-email
>> should add proper quoting itself, but putting quoting in the s-o-b
>> line
>> is probably a good idea (I'm wondering why git didn't add it in the
>> first place.)
>>=20
>
> Not sure what happened here, but I didn't get any wrong from git send-
> email before.

It might do things differently for the author, depending on how you
invoke it (at least the mails I see here look sane.)

>
>> Are you fine with me modifying your s-o-b lines in the commits to
>> include quoting, if I need to resend the pull req?
>>=20
>
> yes, please and thanks.

Ok, I'll update them, if needed.

>
> Cheers,
>       AL
>
>
>> > Acked-by: Cornelia Huck <cohuck@redhat.com>
>> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> > ---
>> > =C2=A0target/s390x/meson.build | 3 +++
>> > =C2=A01 file changed, 3 insertions(+)
>>=20


