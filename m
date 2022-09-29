Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEFD5EF6B3
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 15:35:05 +0200 (CEST)
Received: from localhost ([::1]:51232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odtgu-0000GQ-T7
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 09:35:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ods1w-00084J-U3
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:48:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ods1h-0002EO-Pn
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:48:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664452102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HcnurmJT3xgac93PrarNH+rzHxcbh4MkxsJyz5Zv5q4=;
 b=Rj/m/mr+7SjUQBAWFJ2cAZdtM6LKrj3fL5tDOoK7TDYwz9eevoSc4YnZIOZ5VliuXV9Nmd
 Ueq+futANMswI3Y1u7jXoQ2yotP1CfIWwgRfd75Bt+boo5rBQ6YuwUXftw/cbi7IOvA4PO
 6dmoYacR1Dp0Z+FwFoq+jvSCfWmkeVk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-lBlxRmGQMoCQoAieYDN2iw-1; Thu, 29 Sep 2022 07:48:19 -0400
X-MC-Unique: lBlxRmGQMoCQoAieYDN2iw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 65E64185A7AB;
 Thu, 29 Sep 2022 11:48:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7AFAE2084837;
 Thu, 29 Sep 2022 11:48:18 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2A97F21E691D; Thu, 29 Sep 2022 13:48:17 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: "Denis V. Lunev" <den@openvz.org>
Cc: qemu-devel@nongnu.org,  Alexey Kardashevskiy <aik@ozlabs.ru>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,  =?utf-8?Q?Marc-Andr?=
 =?utf-8?Q?=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,  Eric
 Blake <eblake@redhat.com>
Subject: Re: [PATCH v2 1/1] scripts: check commit message length to fit 75
 characters
References: <20220928163417.1839682-1-den@openvz.org>
Date: Thu, 29 Sep 2022 13:48:17 +0200
In-Reply-To: <20220928163417.1839682-1-den@openvz.org> (Denis V. Lunev's
 message of "Wed, 28 Sep 2022 18:34:17 +0200")
Message-ID: <874jwqtn9a.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Denis V. Lunev" <den@openvz.org> writes:

> There are a lot of commits descriptions which are rendered in the
> 'git log' with line wrap. Apparently, this is looking awkward. Let us
> add check into checkpatch.pl for that.
>
> I am not very good Perl developer, but there is an implementation in
> Linux kernel's checkpatch.pl. Linux kernel people have faced a lot of
> obstacles here thus direct port from them looks beneficial.
>
> Signed-off-by: Denis V. Lunev <den@openvz.org>
> CC: Alexey Kardashevskiy <aik@ozlabs.ru>
> CC: "Philippe Mathieu-Daud=C3=A9" <f4bug@amsat.org>
> CC: "Marc-Andr=C3=A9 Lureau" <marcandre.lureau@redhat.com>
> CC: Paolo Bonzini <pbonzini@redhat.com>
> CC: Eric Blake <eblake@redhat.com>
> CC: Markus Armbruster <armbru@redhat.com>
> ---
> Changes from v1:
> - fixed formatting to match one in the checkpatch.pl file. That was not
>   obvious :(
>
>  scripts/checkpatch.pl | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index d900d18048..fe1ff6c97d 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -36,6 +36,18 @@ my $root;
>  my %debug;
>  my $help =3D 0;
>=20=20
> +our $signature_tags =3D qr{(?xi:
> +	Signed-off-by:|
> +	Co-developed-by:|
> +	Acked-by:|
> +	Tested-by:|
> +	Reviewed-by:|
> +	Reported-by:|
> +	Suggested-by:|
> +	To:|
> +	Cc:
> +)};
> +
>  sub help {
>  	my ($exitcode) =3D @_;
>=20=20
> @@ -1303,6 +1315,7 @@ sub process {
>=20=20
>  	my $in_header_lines =3D $file ? 0 : 1;
>  	my $in_commit_log =3D 0;		#Scanning lines before patch
> +	my $commit_log_long_line =3D 0;
>  	my $reported_maintainer_file =3D 0;
>  	my $non_utf8_charset =3D 0;
>=20=20
> @@ -1585,6 +1598,19 @@ sub process {
>  			WARN("8-bit UTF-8 used in possible commit log\n" . $herecurr);
>  		}
>=20=20
> +		if ($in_commit_log && !$commit_log_long_line && length($line) > 75 &&
> +		    !($line =3D~ /^\s*[a-zA-Z0-9_\/\.]+\s+\|\s+\d+/ ||
> +                            # file delta changes
> +		      $line =3D~ /^\s*(?:[\w\.\-\+]*\/)++[\w\.\-\+]+:/ ||
> +                            # filename then :
> +		      $line =3D~ /^\s*(?:Fixes:|Link:|$signature_tags)/i
> +                            # A Fixes: or Link: line or signature tag li=
ne
> +		      )) {
> +			WARN("Possible unwrapped commit description (prefer a maximum " .
> +			     "75 chars per line)\n" . $herecurr);
> +			$commit_log_long_line =3D 1;
> +		}
> +
>  # ignore non-hunk lines and lines being removed
>  		next if (!$hunk_line || $line =3D~ /^-/);

For comparison, Linux's version:

   # Check for line lengths > 75 in commit log, warn once
                   if ($in_commit_log && !$commit_log_long_line &&
                       length($line) > 75 &&
                       !($line =3D~ /^\s*[a-zA-Z0-9_\/\.]+\s+\|\s+\d+/ ||
                                           # file delta changes
                         $line =3D~ /^\s*(?:[\w\.\-\+]*\/)++[\w\.\-\+]+:/ ||
                                           # filename then :
                         $line =3D~ /^\s*(?:Fixes:|Link:|$signature_tags)/i=
 ||
                                           # A Fixes: or Link: line or sign=
ature tag line
                         $commit_log_possible_stack_dump)) {
                           WARN("COMMIT_LOG_LONG_LINE",
                                "Possible unwrapped commit description (pre=
fer a maximum 75 chars per line)\n" . $herecurr);
                           $commit_log_long_line =3D 1;
                   }

Differences:

* Initial comment lost.  Let's add it back.

* One fewer line break, and spaces instead of tabs.  I think it's best
  to stick to the original there.

* We don't have $commit_log_possible_stack_dump.  Should we?

Initial Linux version was

    2a076f40d8c9 checkpatch, SubmittingPatches: suggest line wrapping
    commit messages at 75 columns

Updates since:

    369c8dd390ba checkpatch: improve tests for fixes:, long lines and
    stack dumps in commit log

    27b379af6102 checkpatch: avoid COMMIT_LOG_LONG_LINE warning for
    signature tags

    36f8b348a94c checkpatch: relax regexp for COMMIT_LOG_LONG_LINE

The first of these also messes with $commit_log_possible_stack_dump.
Added before in

    bf4daf12a9fb checkpatch: avoid some commit message long line warnings

and updated later in

    634cffcc9478 checkpatch: don't interpret stack dumps as commit IDs


