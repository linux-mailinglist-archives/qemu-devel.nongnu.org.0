Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A6051034C
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 18:26:52 +0200 (CEST)
Received: from localhost ([::1]:48668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njO1c-0007Mz-18
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 12:26:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1njNk5-0005c4-Ms
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:08:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1njNk2-0008Si-SA
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:08:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650989321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pvOUsilwgF4VvVR5Hebih8Os9XZNu+zx5CWK7Ivwit4=;
 b=TGf7wXhmtwt78f8mq3SR5TuE38kzMEFNGWPr7VpSeic8Y15JTpkRC36uTRK2mMWQ1GcL8T
 KX0/fbBeyxgCj1SJt9yLp+i4l0+0sMePl8X6Qivm8NwWFRmtSq10l4Y2CJVARJW6IS9xPl
 EPtPjK6dngTMjaMfX8nq3nOTEaoClJU=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-335-jInpe2GnNFCkSqevLUEiCA-1; Tue, 26 Apr 2022 12:08:39 -0400
X-MC-Unique: jInpe2GnNFCkSqevLUEiCA-1
Received: by mail-lf1-f71.google.com with SMTP id
 x29-20020a0565123f9d00b00471c2bbf57cso7366058lfa.12
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:08:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pvOUsilwgF4VvVR5Hebih8Os9XZNu+zx5CWK7Ivwit4=;
 b=Xuoq0mAaVpEAkzXhf0rbaX7+5aNrOTsUWKmCkFpS00dIX08/fORu7AnxSRGMUV4g6b
 PHtl17qyyOSWExfRLsYboGVlT3To6ZnwPR8OaEkZ1Rjp8DfUfZHBU6ShVMytM53z8ts9
 W2CGfsoTPPRKJZkOC6nGb4UvPmYOLYRBMuKfiyZZRLYOr1+UZ+7zuFG8/bUyu1N3RNX2
 /5CUMqpfgCYKB/RU7sr57VUY7HqtwRYaC/Y0vmZ71oro7TPWHYEU92oQXLiviI4hIW76
 4EqMxN3+51oey1QTMlqI2gtGqAIKQoG/YMFz4CF7kfd0cRGloTGHODb4KqHAFid9U7dE
 +euQ==
X-Gm-Message-State: AOAM533CKFpWome6RkiF0Ndc7HwlyxwJUfkijKOcHrkCtOmAunIe7nTE
 DbJT58EyonZsngAJeFlU7Hqp153EE1rippVUCa/2EI8iVi8qDUl5DqjOG5uXtoZfrRdTqVECtNv
 tpbKHqr8waBsHsuGn/dGNTxy8+1uRBPk=
X-Received: by 2002:a2e:7208:0:b0:24f:1821:6953 with SMTP id
 n8-20020a2e7208000000b0024f18216953mr3668792ljc.162.1650989317891; 
 Tue, 26 Apr 2022 09:08:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxnvrkiIdP2AdrJEprIA5bmHvvx1Mu9FAU+8lPOx//gl3tkkxhQqEmG4kzsKMn1TgS13Ar9GwNP118ptPrLCCc=
X-Received: by 2002:a2e:7208:0:b0:24f:1821:6953 with SMTP id
 n8-20020a2e7208000000b0024f18216953mr3668770ljc.162.1650989317639; Tue, 26
 Apr 2022 09:08:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220425215055.611825-1-leobras@redhat.com>
 <20220425215055.611825-6-leobras@redhat.com>
 <Ymfsw8kjkgaH1ysR@xz-m1.local>
In-Reply-To: <Ymfsw8kjkgaH1ysR@xz-m1.local>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Tue, 26 Apr 2022 13:08:26 -0300
Message-ID: <CAJ6HWG4WYxL+p-+mbQ9o1xs8bzA_t8tRk1B2ddKJJrCN+6DFFw@mail.gmail.com>
Subject: Re: [PATCH v9 5/7] multifd: multifd_send_sync_main now returns
 negative on error
To: Peter Xu <peterx@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 26, 2022 at 9:59 AM Peter Xu <peterx@redhat.com> wrote:
>
> On Mon, Apr 25, 2022 at 06:50:54PM -0300, Leonardo Bras wrote:
> > Even though multifd_send_sync_main() currently emits error_reports, it's
> > callers don't really check it before continuing.
> >
> > Change multifd_send_sync_main() to return -1 on error and 0 on success.
> > Also change all it's callers to make use of this change and possibly fail
> > earlier.
> >
> > (This change is important to next patch on  multifd zero copy
> > implementation, to make it sure an error in zero-copy flush does not go
> > unnoticed.
> >
> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
>
> Reviewed-by: Peter Xu <peterx@redhat.com>
>
> --
> Peter Xu
>

Thanks Peter!

Best regards,
Leo


