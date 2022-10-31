Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 646BA613999
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 16:02:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opWIF-0004ma-UR; Mon, 31 Oct 2022 11:01:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opWID-0004m0-G8
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 11:01:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opWIC-0007eI-7S
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 11:01:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667228495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hGV4IwXPqyhkGQ4xhvwV+3Xqk+6wKknxGdwjWFCJjfE=;
 b=W8iUerngt8O70ykECukVzXrkzC3NOi74kXjvzUvv0ts48f6wyUVXqPVPpmUepfA8jakBaA
 AnOGIsB4c612u9zrI5GC/1xSNr+OopbuEeAre/nqjpxraL8XWmC8c++wNX0WWkyJbcBVvZ
 z0gI9yb4yD16d4LHq61ltFRu5y1eKzE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-81-G6GYfviQMlGjGCrvHeYlFg-1; Mon, 31 Oct 2022 11:01:31 -0400
X-MC-Unique: G6GYfviQMlGjGCrvHeYlFg-1
Received: by mail-wr1-f70.google.com with SMTP id
 s11-20020adfbc0b000000b0023659af24a8so3151354wrg.14
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 08:01:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hGV4IwXPqyhkGQ4xhvwV+3Xqk+6wKknxGdwjWFCJjfE=;
 b=4iMigYvrQVz8aYbmgr8gdZul8BXAmhG3Ls/r/zxunFhW/QJAEpafwGM3YrqIgQZSyB
 H9PHsiapMi8EUY1LNKMzk46bG0wcT5l4bcWgun0hD7cYoFlcMy6QTOjOX8t0/dhboSmU
 OM8/V60BH7lpwrUcclA6I0NG9yAJJjLNAMCMKyzxqeUj+HCdtGS1A02w99DYFNPcb0Ku
 zUf4UUlqBvug7gXGdToATfryxzCJSCw03CsVCqqeg35RWs09vT/Kr0EOookCvRPjiQFV
 Oq6Dc9Ro+adtMVbrNfMPgXz0gukjY/B4XgMHEuEKxZ7ZHHJsjGYwPVPN7W8FBg5hdRKT
 eJXQ==
X-Gm-Message-State: ACrzQf3gmqT9c2hVn7Oyn4aBCgOxD41Eb+yKuxkFiQU9tOV4kNKuKJft
 l92vT7v1gyFk3u28DkJKpN6dZNtmiRnLGUGHvyPPRC4HAZUCZA1ki2HAywDU7sr+8lWuPRnwKY+
 rprhbdgtLO1VmDog=
X-Received: by 2002:adf:f651:0:b0:236:9cb8:b939 with SMTP id
 x17-20020adff651000000b002369cb8b939mr8185030wrp.546.1667228489669; 
 Mon, 31 Oct 2022 08:01:29 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM71qRfObruW+29hN2eAhLQaZlZ4vfoGTiNzvADlxmdn8jQcxL+YRbn2P5JZjqwkqzplSS3hWg==
X-Received: by 2002:adf:f651:0:b0:236:9cb8:b939 with SMTP id
 x17-20020adff651000000b002369cb8b939mr8185012wrp.546.1667228489422; 
 Mon, 31 Oct 2022 08:01:29 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 j6-20020a05600c42c600b003c6deb5c1edsm8095903wme.45.2022.10.31.08.01.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 08:01:28 -0700 (PDT)
Date: Mon, 31 Oct 2022 11:01:26 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: Igor Mammedov <imammedo@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [PULL 01/86] bios-tables-test: do not ignore allowed diff list
Message-ID: <20221031110108-mutt-send-email-mst@kernel.org>
References: <20221031124928.128475-1-mst@redhat.com>
 <20221031124928.128475-2-mst@redhat.com>
 <CAARzgwyS-2XmVh6SM_UG6Z85zyJd6VdqqC477RMcWo2_FYsn2g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAARzgwyS-2XmVh6SM_UG6Z85zyJd6VdqqC477RMcWo2_FYsn2g@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Oct 31, 2022 at 06:55:04PM +0530, Ani Sinha wrote:
> 
> 
> On Mon, Oct 31, 2022 at 6:20 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> 
>     we had such a beautiful structure for updating
>     expected files, designed to keep bisect working.
>     It turns out that we ignored the result of
>     the allow list checks unless all tables matched
>     anyway.
> 
>     Sigh.
> 
>     Let's at least make it work going forward.
> 
> 
> Don't forget to drop this. 


Ugh. ENOCOFFE. I will re-push without this.

> 
> 
> 
>     Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>     ---
>      tests/qtest/bios-tables-test.c | 2 +-
>      1 file changed, 1 insertion(+), 1 deletion(-)
> 
>     diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/
>     bios-tables-test.c
>     index e6096e7f73..a72f6ca326 100644
>     --- a/tests/qtest/bios-tables-test.c
>     +++ b/tests/qtest/bios-tables-test.c
>     @@ -458,7 +458,7 @@ static void test_acpi_asl(test_data *data)
>                      "for instructions on how to update expected files.\n",
>                      exp_sdt->aml, sdt->aml_file, exp_sdt->aml_file);
> 
>     -        all_tables_match = all_tables_match &&
>     +        all_tables_match = all_tables_match ||
>                  test_acpi_find_diff_allowed(exp_sdt);
> 
>              /*
>     --
>     MST
> 
> 


