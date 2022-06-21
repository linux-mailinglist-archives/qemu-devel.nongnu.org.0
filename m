Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E10E1552DCA
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 11:02:58 +0200 (CEST)
Received: from localhost ([::1]:40910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3Zmj-00062f-Uk
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 05:02:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o3ZlS-0005IX-Sc
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 05:01:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o3ZlN-00014S-B6
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 05:01:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655802091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Afmq+k/bXQBm7T4/OunrI3I39vW8mK/H0lX5xTOiXY=;
 b=SttuMXlWZEtLbZMr8CWx4r+TBXFlZE7vh9P2dtFJtz7or6SrAruzVkjwmSvuxf8G/4CYpt
 UxKdU4D7KBqyhw9DNBjRHNo/IPaJ4WJ/VxjRZS9Q/IX1BkNZdr2EzyxGhRalTtqbT4XeN8
 cuB75Rap1atB6TBfTIm8hlfBIEQ3B94=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-310-tS4mhjNdNziQ_uflcYJbNg-1; Tue, 21 Jun 2022 05:01:30 -0400
X-MC-Unique: tS4mhjNdNziQ_uflcYJbNg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B96EC101E986;
 Tue, 21 Jun 2022 09:01:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8FBD21121314;
 Tue, 21 Jun 2022 09:01:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4C22221E688E; Tue, 21 Jun 2022 11:01:28 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Delevoryas <pdel@fb.com>
Cc: "samuel.thibault@ens-lyon.org" <samuel.thibault@ens-lyon.org>,
 "jasowang@redhat.com" <jasowang@redhat.com>,  "eblake@redhat.com"
 <eblake@redhat.com>,  Cameron Esfahani via <qemu-devel@nongnu.org>
Subject: Re: [PATCH 3/4] slirp: Add mfr-id to -netdev options
References: <20220616010526.1895564-1-pdel@fb.com>
 <20220616010526.1895564-4-pdel@fb.com> <87k09b6bz1.fsf@pond.sub.org>
 <199AAE52-91F7-44A1-8862-ECCE1A347EFC@fb.com>
Date: Tue, 21 Jun 2022 11:01:28 +0200
In-Reply-To: <199AAE52-91F7-44A1-8862-ECCE1A347EFC@fb.com> (Peter Delevoryas's
 message of "Mon, 20 Jun 2022 21:27:38 +0000")
Message-ID: <87pmj2v193.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Delevoryas <pdel@fb.com> writes:

> On Jun 20, 2022, at 12:16 AM, Markus Armbruster <armbru@redhat.com<mailto=
:armbru@redhat.com>> wrote:

[...]

>> Documentation is rather terse.  It basically provides a bunch of
>> keywords you can throw at the search engine of your choice.  Can we cut
>> out that middle man and point straight to a suitable resource?
>
> Erg, yeah, sorry about that, you=E2=80=99re right, it would probably be m=
ore useful
> to point to the NC-SI specification directly:
>
> https://www.dmtf.org/sites/default/files/standards/documents/DSP0222_1.0.=
0.pdf
>
> Note: there have been some newer revisions to the specification lately, a=
nd the
> full list of spec versions is here:
>
> https://www.dmtf.org/dsp/DSP0222
>
> Get Version ID and the OEM Vendor extension are both specified in 1.0.0, =
so I
> think it should be ok to link to 1.0.0.
>
> I=E2=80=99m not totally sure if I should directly link to the actual URL,=
 but I=E2=80=99ll
> definitely say: =E2=80=9CThis is defined in DMTF NC-SI 1.0.0=E2=80=9D or =
something like that.

Works for me with the full name of the spec: "DMTF Network Controller
Sideband Interface (NC-SI) Specification, version 1.0.0".  You can omit
the version if there are no earlier ones.

> Unless URL=E2=80=99s in the code would be preferred. Theoretically, the D=
MTF
> spec URL should be pretty long-lasting.

Feel free to add URL, too.


