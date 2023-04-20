Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 555646E92D2
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 13:33:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppSWv-0004uS-4Q; Thu, 20 Apr 2023 07:32:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppSWq-0004u5-GA
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 07:32:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppSWp-0007n1-1G
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 07:32:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681990362;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yglNbKC3UpbKLsq7zeJ+I7cSSf9JUvuiLUayXnejVcc=;
 b=MxSUBda+a4a4v4VqzpVsrIpXTJW0ZOtsBY0gPr4oof6XZZRVE3BkLfjQdF83lIGXZH+Uaz
 s7iVDk8gThkqUsGVkUTkkdULAcCDzSeqBMx2tyryCFowuu3N/8sEwh0cuxGHe9XwTRyPxk
 DbioqRLAIsvHlCdJnZ5xVPQPqIvvBhA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-1-ZdTNWs6WM3mvUTg2F0abag-1; Thu, 20 Apr 2023 07:32:40 -0400
X-MC-Unique: ZdTNWs6WM3mvUTg2F0abag-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-2fbb99cb244so327541f8f.3
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 04:32:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681990359; x=1684582359;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yglNbKC3UpbKLsq7zeJ+I7cSSf9JUvuiLUayXnejVcc=;
 b=ObzzOZLYHHvjq0FqUFqzxL+ErOBi/nONwHCb0/RDOF7FZ3f6VkyxuQnvdrljaOFtaQ
 sUyrbo4dWmE2mIq0dnBWtM2rG3TLnMW0EXzj17s/IuguNjsfo2dBrt8PCdbZZ9HTr4KB
 kYC9NG5EoIaZvxjCCdzPjav15/DguXkXn7uy1QeNfXcGyJQWaUDkaPP0IKnAZkvCuVXr
 xBxNCT/EBPfpcm0whF6Dsg8oHJjJaNqf7GZEzrqRw17OCTJn0zICjBtBIIuftdN8+LUi
 LatEDY2WOM7eJPqY6hYJhIuCoNq8YQS3j8ZjuIgl9Sq6wCe8+F5ABIyfa2KEFBpBQ+T2
 0OZQ==
X-Gm-Message-State: AAQBX9cMfYTfS7M8klEt9KfkxjkD/fJy278JJpm3EgCdc/uZoknLOh+2
 gUh1i4PFWkf2j1K4SYBv8BAq9je25rUQ/ubEyl0MhvmMgxyaU257CqtEPwtO1flZZLmlpPTqJLH
 U0WfoxsUxsv/j0dw=
X-Received: by 2002:adf:e48e:0:b0:2f8:9955:6b7c with SMTP id
 i14-20020adfe48e000000b002f899556b7cmr1081300wrm.38.1681990359139; 
 Thu, 20 Apr 2023 04:32:39 -0700 (PDT)
X-Google-Smtp-Source: AKy350bDOdTtE0XEKUtK62ngmbYuGJOgBJ9EwxZiVJf4xaM0PNm7Ed4tPCAyO9P7mn4H8RYyes5gTQ==
X-Received: by 2002:adf:e48e:0:b0:2f8:9955:6b7c with SMTP id
 i14-20020adfe48e000000b002f899556b7cmr1081283wrm.38.1681990358846; 
 Thu, 20 Apr 2023 04:32:38 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 f12-20020adfdb4c000000b002f9ff443184sm1759473wrj.24.2023.04.20.04.32.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 04:32:38 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,  Thomas Huth <thuth@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH 1/2] tests/qtest: capture RESUME events during migration
In-Reply-To: <20230418133100.48799-2-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Tue, 18 Apr 2023 14:30:59
 +0100")
References: <20230418133100.48799-1-berrange@redhat.com>
 <20230418133100.48799-2-berrange@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 20 Apr 2023 13:32:37 +0200
Message-ID: <87zg72yeju.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> When running migration tests we monitor for a STOP event so we can skip
> redundant waits. This will be needed for the RESUME event too shortly.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


I am waiting for you to check the problem than Lukas detected, but this
part of the patch is "obviously" correct.

Famous last words.


