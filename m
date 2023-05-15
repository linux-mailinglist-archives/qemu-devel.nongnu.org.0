Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 929497029C9
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 11:59:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyUyX-00074S-G5; Mon, 15 May 2023 05:58:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pyUyV-000746-Bg
 for qemu-devel@nongnu.org; Mon, 15 May 2023 05:58:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pyUyU-0007sL-0d
 for qemu-devel@nongnu.org; Mon, 15 May 2023 05:58:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684144717;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=k0x/N0GXyNyvNJ8Nx4mCZ72crPadF4QYYaAgIxTxsGw=;
 b=i7RtFXLdtW+T9SYVEr1q0flFSgQBxLBpyEPRkn6Av9auAWi/HwIfTzS3mNEC6gWBExb80N
 T7xHX6tt/SOIfDSPWwo4Xxr6XgqTYUM5VRVupTk1l6iWx5FQJnP+15u2x0vMov2SZgsxot
 Jc8znymQ23LJyw3lQLSSDqARI9knetU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-369-MQ0CA0_uNty3QisamqXZ-g-1; Mon, 15 May 2023 05:58:35 -0400
X-MC-Unique: MQ0CA0_uNty3QisamqXZ-g-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f422150893so56437815e9.2
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 02:58:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684144715; x=1686736715;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k0x/N0GXyNyvNJ8Nx4mCZ72crPadF4QYYaAgIxTxsGw=;
 b=Wi3PL4+umZyFYazQNbw1WNQ/PKHwh0uezv8vsYGijvsftlwScL15LU1F0AcN2Htxjk
 q4Q8CtbgN5ICokgR7ehhYiur/LgaEwuormpn+pJpCAlWcEj0mIBcdTxmM6we+rFxmNPB
 wC0ll5AzKBerojPGUwR3nU+j0ZIokCQzOTMa4E2w42GgA73iJuuMzfjyC+M8iKnNOdui
 TvOCq6jFAwAqIJ5gaiGC7VzmiY9QNP2wS5q43xh6W+pE/nhglSwo5cEpQxzZAXRrE52K
 gPmWnxV5P9kZvLT+K7TUM/0L+FrM+naZjl7dY9LzvOO15L8q7VbDv1oeHkzwe6z5rLwr
 BLfQ==
X-Gm-Message-State: AC+VfDwXDIV8aRXXtY4m47PRPYMbNhyQFhxts4oNX2AF8B4wWe9Wihi7
 9/s0TP1Ew1DsqMblnRicRAiNbXyt/tjG0oh0Ly5/veeJs+mhXXqD8eh75qqinE8B1oJ0UPza0GU
 JPRQ2A1yEHsxcUEI=
X-Received: by 2002:a7b:c388:0:b0:3f5:170:30a7 with SMTP id
 s8-20020a7bc388000000b003f5017030a7mr3128443wmj.41.1684144714775; 
 Mon, 15 May 2023 02:58:34 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ49p0ITe1YWJGjnpYulMYMWDPsLqlHmOFby8F1aqMdQNqA0rYtdpRXwCuWdtvIUGKd/aInyxw==
X-Received: by 2002:a7b:c388:0:b0:3f5:170:30a7 with SMTP id
 s8-20020a7bc388000000b003f5017030a7mr3128435wmj.41.1684144714456; 
 Mon, 15 May 2023 02:58:34 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 a22-20020a1cf016000000b003f42d8dd7ffsm17073749wmb.19.2023.05.15.02.58.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 02:58:34 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Het Gala <het.gala@nutanix.com>
Cc: qemu-devel@nongnu.org,  prerna.saxena@nutanix.com,  dgilbert@redhat.com,
 pbonzini@redhat.com,  berrange@redhat.com,  armbru@redhat.com,
 eblake@redhat.com,  manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com
Subject: Re: [PATCH v4 5/8] migration: converts exec backend to accept
 MigrateAddress struct.
In-Reply-To: <20230512143240.192504-6-het.gala@nutanix.com> (Het Gala's
 message of "Fri, 12 May 2023 14:32:37 +0000")
References: <20230512143240.192504-1-het.gala@nutanix.com>
 <20230512143240.192504-6-het.gala@nutanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 15 May 2023 11:58:33 +0200
Message-ID: <87o7ml29x2.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Het Gala <het.gala@nutanix.com> wrote:
> Exec transport backend for 'migrate'/'migrate-incoming' QAPIs accept
> new wire protocol of MigrateAddress struct.
>
> It is achived by parsing 'uri' string and storing migration parameters
> required for exec connection into strList struct.
>
> Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
> Signed-off-by: Het Gala <het.gala@nutanix.com>
> ---
>  migration/exec.c      | 58 ++++++++++++++++++++++++++++++++-----------
>  migration/exec.h      |  4 +--
>  migration/migration.c | 10 +++-----
>  3 files changed, 50 insertions(+), 22 deletions(-)
>
> diff --git a/migration/exec.c b/migration/exec.c
> index c4a3293246..210f4e9400 100644
> --- a/migration/exec.c
> +++ b/migration/exec.c
> @@ -39,22 +39,51 @@ const char *exec_get_cmd_path(void)
>  }
>  #endif
>  
> -void exec_start_outgoing_migration(MigrationState *s, const char *command,
> +/* provides the length of strList */
> +static int
> +str_list_length(strList *list)
> +{
> +    int len = 0;
> +    strList *elem;
> +
> +    for (elem = list; elem != NULL; elem = elem->next) {
> +        len++;
> +    }
> +
> +    return len;
> +}

I can't believe tat we have a list type and we don't have a length()
function for that type.

Sniff.

Reviewed-by: Juan Quintela <quintela@redhat.com>


