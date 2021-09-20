Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C073411549
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 15:07:43 +0200 (CEST)
Received: from localhost ([::1]:52398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSJ1K-00054A-K2
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 09:07:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mSIyx-0003g7-07
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 09:05:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mSIyu-0001bX-No
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 09:05:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632143111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f+xoB7vlLqUVlcU5eYIJgJp0vNG433LbfPxXmg5UWnk=;
 b=f14v46oJ/LQMmdfLafIjbTAkCa1Cgb7bCBL8n+rW8AL9KFbBGSqo/6mx6UdOA3+xGvehOE
 vRUdHetmYOEEk8okZLwu0dCcTSMbGdp4Ver9IbkEy9raUWw9rFJgUprgnRy4MMMGH9ZlQx
 Gg/ifXYhrERvkhUU9pJHbvTy3b9i6Zw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-MfVogzPLPE6jqseCJFBIdg-1; Mon, 20 Sep 2021 09:05:10 -0400
X-MC-Unique: MfVogzPLPE6jqseCJFBIdg-1
Received: by mail-ed1-f71.google.com with SMTP id
 q17-20020a50c351000000b003d81427d25cso9085734edb.15
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 06:05:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f+xoB7vlLqUVlcU5eYIJgJp0vNG433LbfPxXmg5UWnk=;
 b=1HZIVxqBIYkpR6k6RDYEugoL8kuRZpl4LuugHDAB0IuiylGldZDJ3aJaFPxZdM6NWC
 TrvfKXUEGS6qx4iiz5ER2DlfzsX2KrVCPp8D+450Pev4eFDUAPyt8wgRcbxinhAc8QSs
 Y7VHcVSFIGvHWDQ3854fcbWeHuwbO/jqJx2WxGUnuevB/4Q6qtN6Fcen6OpSHU9v1e9q
 BXqdQ8DRKKg6aWVsMm2LurkCGA5NlCPS21iIo3L3+V0VZyfFytwzw6MVp9eLssx2+Fl2
 EigHw35Q4lgx0gzsodOobyDV5ItaQoEvSt7kT/oO5k1jlrIXN75xA0qplzj0k+lA/qUl
 lXTQ==
X-Gm-Message-State: AOAM531kIV6uLJa64do5vtu8wC7rA2pr4IXl5x+gWDOq0MfCqVbEmQz9
 dalwnURD37mj8dmb/JY25hP9yu1o5t3EVYVWdD/jImqkkQuiPDSFN1pjwlqyQGluLh4nzDt6a73
 113AFqW8oV6RGSJo=
X-Received: by 2002:a17:906:35d8:: with SMTP id
 p24mr28040979ejb.292.1632143109561; 
 Mon, 20 Sep 2021 06:05:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqmZsMR7p1CbtLEzgKUHpJT0Ydf2dzOZKhpLDZygcQx6YEZYSNvd+U7Y/1Iv4u7uVihhR/AA==
X-Received: by 2002:a17:906:35d8:: with SMTP id
 p24mr28040960ejb.292.1632143109389; 
 Mon, 20 Sep 2021 06:05:09 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id a5sm7214761edm.37.2021.09.20.06.05.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 06:05:08 -0700 (PDT)
Date: Mon, 20 Sep 2021 15:05:07 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v6 01/10] ACPI ERST: bios-tables-test.c steps 1 and 2
Message-ID: <20210920150507.17110ed1@redhat.com>
In-Reply-To: <1628202639-16361-2-git-send-email-eric.devolder@oracle.com>
References: <1628202639-16361-1-git-send-email-eric.devolder@oracle.com>
 <1628202639-16361-2-git-send-email-eric.devolder@oracle.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.475,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: ehabkost@redhat.com, mst@redhat.com, konrad.wilk@oracle.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu,  5 Aug 2021 18:30:30 -0400
Eric DeVolder <eric.devolder@oracle.com> wrote:

> Following the guidelines in tests/qtest/bios-tables-test.c, this
> change adds empty placeholder files per step 1 for the new ERST
> table, and excludes resulting changed files in bios-tables-test-allowed-diff.h
> per step 2.
> 

I'd move this right before 10/10

> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>

Acked-by: Igor Mammedov <imammedo@redhat.com>


> ---
>  tests/data/acpi/microvm/ERST                | 0
>  tests/data/acpi/pc/ERST                     | 0
>  tests/data/acpi/q35/ERST                    | 0
>  tests/qtest/bios-tables-test-allowed-diff.h | 6 ++++++
>  4 files changed, 6 insertions(+)
>  create mode 100644 tests/data/acpi/microvm/ERST
>  create mode 100644 tests/data/acpi/pc/ERST
>  create mode 100644 tests/data/acpi/q35/ERST
> 
> diff --git a/tests/data/acpi/microvm/ERST b/tests/data/acpi/microvm/ERST
> new file mode 100644
> index 0000000..e69de29
> diff --git a/tests/data/acpi/pc/ERST b/tests/data/acpi/pc/ERST
> new file mode 100644
> index 0000000..e69de29
> diff --git a/tests/data/acpi/q35/ERST b/tests/data/acpi/q35/ERST
> new file mode 100644
> index 0000000..e69de29
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523..b3aaf76 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,7 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/pc/ERST",
> +"tests/data/acpi/q35/ERST",
> +"tests/data/acpi/microvm/ERST",
> +"tests/data/acpi/pc/DSDT",
> +"tests/data/acpi/q35/DSDT",
> +"tests/data/acpi/microvm/DSDT",


