Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB1032B7B9
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 13:09:17 +0100 (CET)
Received: from localhost ([::1]:49364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHQJY-0007f0-M6
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 07:09:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lHQHD-0005O4-4D
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 07:06:51 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:44148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lHQH7-0002x6-LA
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 07:06:50 -0500
Received: by mail-wr1-x434.google.com with SMTP id h98so23378269wrh.11
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 04:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=LDvxBiI8Mx2a2OGJtdzOHnMNjHaH3t+K+lacw59no+c=;
 b=h7R+OAdYIqExMRw7Lx+Q7PnrE32WtR+SJdcHVkcL8excmPBj78lgoedwhMEJQ7HEsE
 CSi/uUJMf/7F+dDTqWgTuFdHFr/wApc4XxmHg+2oIZW57gU+dU69ttrIriXQkrKem7qk
 VzUhT7YxbleDqt1GhwUuqckt4CAaoPYgJmyGvXhO3KDbCCDhT9kDeRHegTQz+cgQ4hf/
 5RJY6YaOfV1eeBr+ERWDZJEFh0eajbr7IqtbiRtVx4xRNgExs+dvZXGHSg7dwLPxVWdv
 TUhkbyU+f2sUSCRnARWf77cpxw7vAo+3h+seis8EdSY/5uwQ1cZOaLxfDX1nX3peV3Wy
 RCqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=LDvxBiI8Mx2a2OGJtdzOHnMNjHaH3t+K+lacw59no+c=;
 b=UNtUX34vosOALH/k122e3e7Cs5L4NmMlpmuHLh/fMbcDLqNakluhJ0nJ93bItJrbvY
 V55dQ7C0mqfsWK5I4HsHgET9Z1UU+rNi50SR9m1562ExFWLJSwXAq9JEMXsxavQ/uCvf
 KrRwQkyXZjrQYE7/3vWewfZNCldpW+fgzaB4EZTD3Mcg+EOw3iNukWpGZccX50zNYM7d
 q4na7BhFl2rb/T4aEj49/CTPzKjqAezxKnz7P+nSNDj/Mf1QLzbAEQcZCNaZEy4E9HYs
 TcQIXMqcEpzGzPSgev3nRPHakRR36HZtj0x8714V6zEUJ9O/GYrCSza67pIgMVj9DxJd
 Zycg==
X-Gm-Message-State: AOAM531zCEMVj1FXqiiKAgRIqbmWcxycDKmsZo5nYBwCdfpoEFlGE15A
 Xu+ie4QD9Bn+279B7gJkOQ3L1g==
X-Google-Smtp-Source: ABdhPJw51etegT0BktzOnlHWnfaoNsRCbFswZufnfgeDLYcgDWV4rvALC0mNp+Lvh9STaTmBv8LkRQ==
X-Received: by 2002:a5d:6a86:: with SMTP id s6mr13733331wru.307.1614773204153; 
 Wed, 03 Mar 2021 04:06:44 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h62sm6386155wmf.37.2021.03.03.04.06.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 04:06:43 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6D0F71FF7E;
 Wed,  3 Mar 2021 12:06:42 +0000 (GMT)
References: <20210205171817.2108907-1-philmd@redhat.com>
 <20210205171817.2108907-5-philmd@redhat.com>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 4/8] scripts/device-crash-test: Replace the word
 'whitelist'
Date: Wed, 03 Mar 2021 12:06:00 +0000
In-reply-to: <20210205171817.2108907-5-philmd@redhat.com>
Message-ID: <87zgzkh25p.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Otubo <otubo@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Michael Roth <michael.roth@amd.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Follow the inclusive terminology from the "Conscious Language in your
> Open Source Projects" guidelines [*] and replace the word "whitelist"
> appropriately.
>
> [*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md
>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  scripts/device-crash-test | 30 +++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)
>
> diff --git a/scripts/device-crash-test b/scripts/device-crash-test
> index 04118669ba7..6812de42f8c 100755
> --- a/scripts/device-crash-test
> +++ b/scripts/device-crash-test
> @@ -41,18 +41,18 @@ logger =3D logging.getLogger('device-crash-test')
>  dbg =3D logger.debug
>=20=20
>=20=20
> -# Purposes of the following whitelist:
> +# Purposes of the following allowlist:
>  # * Avoiding verbose log messages when we find known non-fatal
>  #   (exitcode=3D1) errors
>  # * Avoiding fatal errors when we find known crashes
>  # * Skipping machines/devices that are known not to work out of
>  #   the box, when running in --quick mode
>  #
> -# Keeping the whitelist updated is desirable, but not required,
> +# Keeping the allowlist updated is desirable, but not required,
>  # because unexpected cases where QEMU exits with exitcode=3D1 will
>  # just trigger a INFO message.
>=20=20
> -# Valid whitelist entry keys:
> +# Valid allowlist entry keys:
>  # * accel: regexp, full match only
>  # * machine: regexp, full match only
>  # * device: regexp, full match only
> @@ -62,7 +62,7 @@ dbg =3D logger.debug
>  # * expected: if True, QEMU is expected to always fail every time
>  #   when testing the corresponding test case
>  # * loglevel: log level of log output when there's a match.
> -ERROR_WHITELIST =3D [
> +ERROR_ALLOWLIST =3D [
>      # Machines that won't work out of the box:
>      #             MACHINE                         | ERROR MESSAGE
>      {'machine':'niagara', 'expected':True},       # Unable to load a fir=
mware for -M niagara
> @@ -187,9 +187,9 @@ ERROR_WHITELIST =3D [
>=20=20
>=20=20
>  def whitelistTestCaseMatch(wl, t):
> -    """Check if a test case specification can match a whitelist entry
> +    """Check if a test case specification can match a allowlist entry

Seems like the function names (and params?) could be updated as well.

>=20=20
> -    This only checks if a whitelist entry is a candidate match
> +    This only checks if a allowlist entry is a candidate match
>      for a given test case, it won't check if the test case
>      results/output match the entry.  See whitelistResultMatch().
>      """
> @@ -206,16 +206,16 @@ def whitelistTestCaseMatch(wl, t):
>=20=20
>  def whitelistCandidates(t):
>      """Generate the list of candidates that can match a test case"""
> -    for i, wl in enumerate(ERROR_WHITELIST):
> +    for i, wl in enumerate(ERROR_ALLOWLIST):
>          if whitelistTestCaseMatch(wl, t):
>              yield (i, wl)
>=20=20
>=20=20
>  def findExpectedResult(t):
> -    """Check if there's an expected=3DTrue whitelist entry for a test ca=
se
> +    """Check if there's an expected=3DTrue allowlist entry for a test ca=
se
>=20=20
>      Returns (i, wl) tuple, where i is the index in
> -    ERROR_WHITELIST and wl is the whitelist entry itself.
> +    ERROR_ALLOWLIST and wl is the allowlist entry itself.
>      """
>      for i, wl in whitelistCandidates(t):
>          if wl.get('expected'):
> @@ -223,7 +223,7 @@ def findExpectedResult(t):
>=20=20
>=20=20
>  def whitelistResultMatch(wl, r):
> -    """Check if test case results/output match a whitelist entry
> +    """Check if test case results/output match a allowlist entry
>=20=20
>      It is valid to call this function only if
>      whitelistTestCaseMatch() is True for the entry (e.g. on
> @@ -237,10 +237,10 @@ def whitelistResultMatch(wl, r):
>=20=20
>=20=20
>  def checkResultWhitelist(r):
> -    """Look up whitelist entry for a given test case result
> +    """Look up allowlist entry for a given test case result
>=20=20
>      Returns (i, wl) tuple, where i is the index in
> -    ERROR_WHITELIST and wl is the whitelist entry itself.
> +    ERROR_ALLOWLIST and wl is the allowlist entry itself.
>      """
>      for i, wl in whitelistCandidates(r['testcase']):
>          if whitelistResultMatch(wl, r):
> @@ -544,7 +544,7 @@ def main():
>=20=20
>          if f:
>              i, wl =3D checkResultWhitelist(f)
> -            dbg("testcase: %r, whitelist match: %r", t, wl)
> +            dbg("testcase: %r, allowlist match: %r", t, wl)
>              wl_stats.setdefault(i, []).append(f)
>              level =3D wl.get('loglevel', logging.DEBUG)
>              logFailure(f, level)
> @@ -561,9 +561,9 @@ def main():
>=20=20
>      if args.debug:
>          stats =3D sorted([(len(wl_stats.get(i, [])), wl) for i, wl in
> -                         enumerate(ERROR_WHITELIST)], key=3Dlambda x: x[=
0])
> +                         enumerate(ERROR_ALLOWLIST)], key=3Dlambda x: x[=
0])
>          for count, wl in stats:
> -            dbg("whitelist entry stats: %d: %r", count, wl)
> +            dbg("allowlist entry stats: %d: %r", count, wl)
>=20=20
>      if fatal_failures:
>          for f in fatal_failures:


--=20
Alex Benn=C3=A9e

