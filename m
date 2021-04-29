Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB49E36E499
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 07:46:04 +0200 (CEST)
Received: from localhost ([::1]:49184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbzUx-0003Zi-77
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 01:46:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lbzSz-0002WU-BI
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 01:44:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lbzSv-0006fI-IT
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 01:44:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619675035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3GdYB964ApLu6KE9/9InRx2W3N3xzfPQNHcoP7SsMbE=;
 b=gbmaEaeEwn9cH9UwfhKSi2SmZZrMzU5OrNuVrm7MA5IOhMIw2EpJKzMdd0HtuExQ4SRT8O
 BOhAP5u7G1Jd6JqJqowcbE3KTnTL1RogTp5TTSnHPxugpQRtl7MTSJVN3nmk0C+iMqmAQY
 MNJZB8krSLvHCgAxAUKmA2hIl3khDm4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-lQma-2XOODiHyWAZTIef9g-1; Thu, 29 Apr 2021 01:43:52 -0400
X-MC-Unique: lQma-2XOODiHyWAZTIef9g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1CE4EC1A1;
 Thu, 29 Apr 2021 05:43:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A344219D7C;
 Thu, 29 Apr 2021 05:43:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2B934113525D; Thu, 29 Apr 2021 07:43:49 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v4 10/12] qtest/qmp-cmd-test: Make test
 build-independent from accelerator
References: <20210415163304.4120052-1-philmd@redhat.com>
 <20210415163304.4120052-11-philmd@redhat.com>
Date: Thu, 29 Apr 2021 07:43:49 +0200
In-Reply-To: <20210415163304.4120052-11-philmd@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 15 Apr 2021 18:33:02
 +0200")
Message-ID: <87lf91ir1m.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "Daniel P . =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Igor Mammedov <imammedo@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Now than we can probe if the TCG accelerator is available
> at runtime with a QMP command, do it once at the beginning
> and only register the tests we can run.
> We can then replace the #ifdef'ry by a runtime check.
>
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Please read the last remark first.  The other ones are detail; feel free
to skip them until we're done with the last one.

> ---
>  tests/qtest/qmp-cmd-test.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
>
> diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
> index c98b78d0339..8902d2f169f 100644
> --- a/tests/qtest/qmp-cmd-test.c
> +++ b/tests/qtest/qmp-cmd-test.c
> @@ -21,19 +21,24 @@ const char common_args[] =3D "-nodefaults -machine no=
ne";
> =20
>  /* Query smoke tests */
> =20
> +static bool tcg_accel_available;
> +
>  static int query_error_class(const char *cmd)
>  {
> -    static struct {
> +    static const struct {
>          const char *cmd;
>          int err_class;
> +        /*
> +         * Pointer to boolean.

Let's not paraphrase code in comments.

> +         * If non-NULL and value is %true, the error class is skipped.

Suggest "When it points to true, the test case is skipped", and ...

> +         */
> +        bool *skip_err_class;

... name this just @skip.  Or maybe @skip_ptr, because fails[i].skip
reads as if the test case was to be skipped.

>      } fails[] =3D {
>          /* Success depends on build configuration: */

Note the headline ^^^

>  #ifndef CONFIG_SPICE
>          { "query-spice", ERROR_CLASS_COMMAND_NOT_FOUND },
>  #endif
> -#ifndef CONFIG_TCG
> -        { "query-replay", ERROR_CLASS_COMMAND_NOT_FOUND },
> -#endif
> +        { "query-replay", ERROR_CLASS_COMMAND_NOT_FOUND, &tcg_accel_avai=
lable },

No longer fits under the headline.  Move it under its own headline,
perhaps

           /* Success depends on dynamic state as reported by other queries=
 */

>  #ifndef CONFIG_VNC
>          { "query-vnc", ERROR_CLASS_GENERIC_ERROR },
>          { "query-vnc-servers", ERROR_CLASS_GENERIC_ERROR },
> @@ -51,6 +56,9 @@ static int query_error_class(const char *cmd)
>      int i;
> =20
>      for (i =3D 0; fails[i].cmd; i++) {
> +        if (fails[i].skip_err_class && *fails[i].skip_err_class) {
> +            continue;
> +        }
>          if (!strcmp(cmd, fails[i].cmd)) {
>              return fails[i].err_class;
>          }
> @@ -334,6 +342,8 @@ int main(int argc, char *argv[])
>      QmpSchema schema;
>      int ret;
> =20
> +    tcg_accel_available =3D qtest_has_accel("tcg");
> +

When does tcg_accel_available differ from defined(CONFIG_TCG)?

>      g_test_init(&argc, &argv, NULL);
> =20
>      qmp_schema_init(&schema);


