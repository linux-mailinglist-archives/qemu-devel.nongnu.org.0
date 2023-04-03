Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A996D5358
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 23:19:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjRYy-0002gg-Bb; Mon, 03 Apr 2023 17:18:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pjRYw-0002gX-Oi
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 17:18:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pjRYr-0006fC-20
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 17:18:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680556676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qPNutP1+hClTh97JsuFIN8SFQr/8KzVoM32tTH2ROz8=;
 b=BvSjD0MAbMA3h0Qk6cx8VyzYPc9WrJgsrTxksFfpcxeIpQgP3ny/I5ePnxGY9YSP7EIkqk
 F1y5erp7TK2BckEaYifAaxwO6ZwVxlTbbn3ZdsHO4OyPSETys6uwsMGW7tb9eCYyZk20ss
 CX6EjG/bVYrhaVQL2l+u10iTiKcKDWs=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-6KOyZhm6OvmyTB7kIWgoRQ-1; Mon, 03 Apr 2023 17:17:55 -0400
X-MC-Unique: 6KOyZhm6OvmyTB7kIWgoRQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 b142-20020ae9eb94000000b007486a8b9ae9so11128411qkg.11
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 14:17:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680556674; x=1683148674;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qPNutP1+hClTh97JsuFIN8SFQr/8KzVoM32tTH2ROz8=;
 b=w0AaIFVs+UD2ag6Um+MJCra4AdUXHCjKqNLNJZCs6aNY4Nz/EpDSJc8r5Of0LWuciC
 U7J9lbJHpqW7okDlXvnvFEbti4dKEkLlMcP8uuRXE9ljScSvzMS7nXAD1n1jYS3GH8uD
 ZgGsgHtKixB2vBPVvMdPqxAKxVVly4CD3HmY0U7HJ7Qyly1CQUq9o5EW1BcNQ71EdhT8
 uY4WH7P4da8AJtVhR2PW3Kf4AdliYL18bDxXkDf2rzVT5EobIZyM9RFX6iDX7If6hQQW
 oKEkCPTS1jx/SVkAKPbiuzAdZiOAsuOrxOPaIZXnLz/fLCdPsJ/47isPg1mggfOedR0W
 RyVg==
X-Gm-Message-State: AAQBX9dJJ+KMbZKdX7op7/DBmafcTNL65IXLjPwfMtcWZqiNqJ7Lr9cS
 u3D6lMX1rxJhcaJNopB9mUJz/k25oyRJ9w4TuY+sr8zKFOUe073bFXQwbmPQpmR7W1P7MySJx0p
 kLE9OTUzYMgBD7Oo=
X-Received: by 2002:a05:6214:509b:b0:5af:3a13:202d with SMTP id
 kk27-20020a056214509b00b005af3a13202dmr240535qvb.4.1680556674627; 
 Mon, 03 Apr 2023 14:17:54 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZJ5fHXxRtwhfTXT9pMpluVCKEuMP+J2CxACCDyeCOvNgZUjS2Scqn4zvewQz6LzLSYOmgl8Q==
X-Received: by 2002:a05:6214:509b:b0:5af:3a13:202d with SMTP id
 kk27-20020a056214509b00b005af3a13202dmr240514qvb.4.1680556674375; 
 Mon, 03 Apr 2023 14:17:54 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 fc15-20020ad44f2f000000b005e0d14cf0f6sm2908998qvb.124.2023.04.03.14.17.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 14:17:53 -0700 (PDT)
Date: Mon, 3 Apr 2023 17:17:52 -0400
From: Peter Xu <peterx@redhat.com>
To: Lukas Straub <lukasstraub2@web.de>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH RESEND 1/2] qtest/migration-test.c: Add test with
 compress enabled
Message-ID: <ZCtCgDV9DI5BlcQH@x1n>
References: <af76761aa6978071c5b8e9b872b697db465a5520.1680457631.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <af76761aa6978071c5b8e9b872b697db465a5520.1680457631.git.lukasstraub2@web.de>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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

On Sun, Apr 02, 2023 at 05:47:45PM +0000, Lukas Straub wrote:
> There has never been a test for migration with compress enabled.
> 
> Add a suitable test, testing with compress-wait-thread = false
> too.
> 
> iterations = 2 is intentional, so it also tests that no invalid
> thread state is left over from the previous iteration.
> 
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>

Overall looks good to me:

Reviewed-by: Peter Xu <peterx@redhat.com>

A few nitpicks below.

> ---
>  tests/qtest/migration-test.c | 67 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
> 
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index 3b615b0da9..dbcab2e8ae 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -406,6 +406,41 @@ static void migrate_set_parameter_str(QTestState *who, const char *parameter,
>      migrate_check_parameter_str(who, parameter, value);
>  }
>  
> +static long long migrate_get_parameter_bool(QTestState *who,
> +                                           const char *parameter)
> +{
> +    QDict *rsp;
> +    int result;
> +
> +    rsp = wait_command(who, "{ 'execute': 'query-migrate-parameters' }");
> +    result = qdict_get_bool(rsp, parameter);
> +    qobject_unref(rsp);
> +    return !!result;
> +}
> +
> +static void migrate_check_parameter_bool(QTestState *who, const char *parameter,
> +                                        int value)
> +{
> +    int result;
> +
> +    result = migrate_get_parameter_bool(who, parameter);
> +    g_assert_cmpint(result, ==, value);
> +}
> +
> +static void migrate_set_parameter_bool(QTestState *who, const char *parameter,
> +                                      int value)
> +{
> +    QDict *rsp;
> +
> +    rsp = qtest_qmp(who,
> +                    "{ 'execute': 'migrate-set-parameters',"
> +                    "'arguments': { %s: %i } }",
> +                    parameter, value);
> +    g_assert(qdict_haskey(rsp, "return"));
> +    qobject_unref(rsp);
> +    migrate_check_parameter_bool(who, parameter, value);
> +}
> +
>  static void migrate_ensure_non_converge(QTestState *who)
>  {
>      /* Can't converge with 1ms downtime + 3 mbs bandwidth limit */
> @@ -1524,6 +1559,36 @@ static void test_precopy_unix_xbzrle(void)
>      test_precopy_common(&args);
>  }
>  
> +static void *
> +test_migrate_compress_start(QTestState *from,
> +                          QTestState *to)
> +{
> +    migrate_set_parameter_int(from, "compress-level", 9);
> +    migrate_set_parameter_int(from, "compress-threads", 1);
> +    migrate_set_parameter_bool(from, "compress-wait-thread", false);

May worth trying both true/false (can split into two tests)?

> +    migrate_set_parameter_int(to, "decompress-threads", 1);

Why not set both compress/decompress threads to something >1 to check arace
conditions between the threads?

> +
> +    migrate_set_capability(from, "compress", true);
> +    migrate_set_capability(to, "compress", true);
> +
> +    return NULL;
> +}
> +
> +static void test_precopy_unix_compress(void)
> +{
> +    g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
> +    MigrateCommon args = {
> +        .connect_uri = uri,
> +        .listen_uri = uri,
> +

Empty line.

> +        .start_hook = test_migrate_compress_start,
> +

Empty line.

> +        .iterations = 2,

Maybe move the comment in commit message over here?

> +    };
> +
> +    test_precopy_common(&args);
> +}
> +
>  static void test_precopy_tcp_plain(void)
>  {
>      MigrateCommon args = {
> @@ -2515,6 +2580,8 @@ int main(int argc, char **argv)
>      qtest_add_func("/migration/bad_dest", test_baddest);
>      qtest_add_func("/migration/precopy/unix/plain", test_precopy_unix_plain);
>      qtest_add_func("/migration/precopy/unix/xbzrle", test_precopy_unix_xbzrle);
> +    qtest_add_func("/migration/precopy/unix/compress",
> +                   test_precopy_unix_compress);
>  #ifdef CONFIG_GNUTLS
>      qtest_add_func("/migration/precopy/unix/tls/psk",
>                     test_precopy_unix_tls_psk);
> -- 
> 2.30.2
> 



-- 
Peter Xu


