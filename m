Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B20F209C45
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jun 2020 11:48:48 +0200 (CEST)
Received: from localhost ([::1]:38008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joOUx-0005DR-3e
	for lists+qemu-devel@lfdr.de; Thu, 25 Jun 2020 05:48:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1joOU4-0004o7-El
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 05:47:52 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:42702
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1joOU2-0006kZ-68
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 05:47:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593078468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=svZq5ij1dYgnFl+zc0DCoJN4y7LnEh5vNwxfWdZvJJc=;
 b=hJw9UZcjLHIG82nlLyNXrOA+DbraW/DKSK18jWODwHqB+DR8D5CGvyR4T3+cVYzsVWcnhM
 vi27FvxMmHNEPmMQGrhbIH4G15ykanlp7C2aiEvMWg0Or/asLcnxJq8ZVOTvea4s6Wg1fs
 Xnmzgz6co6oNeSW06vQX9JkvLMbzCYE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-1A5fBON5MmOVtxGGpkb3Mw-1; Thu, 25 Jun 2020 05:47:46 -0400
X-MC-Unique: 1A5fBON5MmOVtxGGpkb3Mw-1
Received: by mail-wm1-f72.google.com with SMTP id h25so6789308wmb.0
 for <qemu-devel@nongnu.org>; Thu, 25 Jun 2020 02:47:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=svZq5ij1dYgnFl+zc0DCoJN4y7LnEh5vNwxfWdZvJJc=;
 b=Cug/Y/Ntg/XPmM+MdWX2snNRWeuzAw5tBXP5aabY+kz18ACBQ/C8/fcuyIqBrLy63j
 hekXt+3rFE67xN/m0HDVHU9OZ0386QEPL9V8EppavN0Ka99mKdAiLEH7/czw+7W8yms8
 YW0woFmP9KlX/bDbVkvTsEtU0MMqf440MVRrS1ittxJmi2JEMUoBLWpA8rmiHTAqMV1D
 KxdJAipLygR4fMWYfYqpmMbfk+UDYUjfh4tDbVkebl74sHSnBmWFB5rJpmLSCRav1kbr
 oU354/kJkDUH1XUHu7T7ldMpJ7TOiBLBttxdxdZ1JRZNVhrey0P7zXV28Oh9yYmUAfzH
 bJJw==
X-Gm-Message-State: AOAM533l7nwSu1ztAblqTTZ1pCYQ9Dd3yr5TMLMoQFAqE7IeKB14EaVn
 Pj+6lSKPQOHChoQ6iVND+wAiV0XDjX+oGAF4CQeFTg14w8pvnuu/e99hWPEsf0G4Q3d1co7Jsjz
 lIm1jvXOI3W+FDB0=
X-Received: by 2002:adf:afc3:: with SMTP id y3mr37028754wrd.277.1593078465784; 
 Thu, 25 Jun 2020 02:47:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaWinZFdDmTfhlXa74R9hyfiR6Y/y5l6oLrz9adAUIFn/ankxxTDv5d0GFMczU8WLfPkypzQ==
X-Received: by 2002:adf:afc3:: with SMTP id y3mr37028732wrd.277.1593078465531; 
 Thu, 25 Jun 2020 02:47:45 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:91d0:a5f0:9f34:4d80?
 ([2001:b07:6468:f312:91d0:a5f0:9f34:4d80])
 by smtp.gmail.com with ESMTPSA id f14sm14074891wro.90.2020.06.25.02.47.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jun 2020 02:47:44 -0700 (PDT)
Subject: Re: [PATCH v3 2/2] tests/qmp-cmd-test: Add qmp/object-add-duplicate-id
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, berrange@redhat.com, ehabkost@redhat.com,
 armbru@redhat.com
References: <20200624194809.26600-1-eric.auger@redhat.com>
 <20200624194809.26600-3-eric.auger@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <f4d309a0-8a2b-f780-763b-da3bd6a7b271@redhat.com>
Date: Thu, 25 Jun 2020 11:47:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200624194809.26600-3-eric.auger@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/25 02:30:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/06/20 21:48, Eric Auger wrote:
> This new test checks that attempting to create an object
> with an existing ID gracefully fails.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Acked-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/qtest/qmp-cmd-test.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
> index 9f5228cd99..ceb3296691 100644
> --- a/tests/qtest/qmp-cmd-test.c
> +++ b/tests/qtest/qmp-cmd-test.c
> @@ -213,6 +213,23 @@ static void test_object_add_without_props(void)
>      qtest_quit(qts);
>  }
>  
> +static void test_object_add_with_duplicate_id(void)
> +{
> +    QTestState *qts;
> +    QDict *resp;
> +
> +    qts = qtest_init(common_args);
> +    resp = qtest_qmp(qts, "{'execute': 'object-add', 'arguments':"
> +                    " {'qom-type': 'memory-backend-ram', 'id': 'ram1', 'props': {'size': 4294967296 } } }");
> +    g_assert_nonnull(resp);
> +    g_assert(qdict_haskey(resp, "return"));
> +    resp = qtest_qmp(qts, "{'execute': 'object-add', 'arguments':"
> +                    " {'qom-type': 'memory-backend-ram', 'id': 'ram1', 'props': {'size': 4294967296 } } }");
> +    g_assert_nonnull(resp);
> +    qmp_assert_error_class(resp, "GenericError");
> +    qtest_quit(qts);
> +}
> +
>  int main(int argc, char *argv[])
>  {
>      QmpSchema schema;
> @@ -225,6 +242,8 @@ int main(int argc, char *argv[])
>  
>      qtest_add_func("qmp/object-add-without-props",
>                     test_object_add_without_props);
> +    qtest_add_func("qmp/object-add-duplicate-id",
> +                   test_object_add_with_duplicate_id);
>      /* TODO: add coverage of generic object-add failure modes */
>  
>      ret = g_test_run();
> 

It would be nice also to add a test for adding the same object twice,
first failing and then succeeding (the difference between v2 and v3).
However it can be added as a separate patch.

Paolo


