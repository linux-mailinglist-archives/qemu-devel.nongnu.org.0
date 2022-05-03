Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B05855181A4
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 11:49:26 +0200 (CEST)
Received: from localhost ([::1]:34144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlp9p-0000dq-Nr
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 05:49:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nlp79-00069E-SF
 for qemu-devel@nongnu.org; Tue, 03 May 2022 05:46:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nlp78-000512-DY
 for qemu-devel@nongnu.org; Tue, 03 May 2022 05:46:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651571197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XgsLK+a8GqaptVnx0x3uq64cMwdCbZJlKxCz2aAvMiM=;
 b=hYR+r4JSNUcyqDIjAN1kVza72HnZFAS57v2/vcUzoaKCv1zfscpM19RioXxWM3OB/DiWZQ
 qDMa3CUeXOx7d52BOaLUq5EZfpSJtia3xMFSPGgYhZTDJKcR8u5IQ0EJeXqPiYQCf7G0Jw
 dYS34dCBIJ6TJEXLxMTOx4JrYoiQMXQ=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-173-Vh5_Tcv9OaSbmIlr8swj8w-1; Tue, 03 May 2022 05:46:36 -0400
X-MC-Unique: Vh5_Tcv9OaSbmIlr8swj8w-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-2f4dee8688cso154612747b3.16
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 02:46:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:references:mime-version:in-reply-to:date
 :message-id:subject:to:cc;
 bh=XgsLK+a8GqaptVnx0x3uq64cMwdCbZJlKxCz2aAvMiM=;
 b=CVsgZ03kYBFIxnfDuyCvS0ENNhkgNlwjTLahmbAr5uykRxTdjMwjxstmfTlBcq++EE
 RAzYamjD4c6rZ7Q1/k0QADATa/7PTDSZ8+mscVyo8q5/5+AxUR7n7bT0ysjieuXSJPTJ
 6WUktatFKHURLXd10zRF2zAlb70b2MMc50Mgimrdahq502E+iCtud8umkFKnEiQ0dgpc
 066ItENl57pEoWQ9B0nISjmRGHVSV38DmgtzuxEyuxh688VvMdEOJHiw1n2ZIJ4WWKzM
 lYTE8tEf7j4QNVEVE3PckvsUxn0+pNUal03eeYPSK1Zcm8fygB70tHseVBok9Tq3ijfy
 B7/A==
X-Gm-Message-State: AOAM530hPh4nz2MSHw0itoz9GN4ITjOkiN2E6pMVEqtkR6YDlExWlEtT
 7iW3NBirlesYXjACbXMGc365URSXNwzwpysNYjMJHsbwFL8MEnkkB6s7JdcyhXZ0386mMS2RMm2
 sRpAVwtEDcLOsgp1Hg8kBm+UQHrVF1SY=
X-Received: by 2002:a81:b4e:0:b0:2f7:bc6a:9643 with SMTP id
 75-20020a810b4e000000b002f7bc6a9643mr14557823ywl.87.1651571196377; 
 Tue, 03 May 2022 02:46:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlhbR9sVnNKh/deck5lE6N/F37m/aUou7r6qTQxYNKLtB60GQbkcRwAsztaVqlJ0n4vycDp5JCIIE0xlJ7mc8=
X-Received: by 2002:a81:b4e:0:b0:2f7:bc6a:9643 with SMTP id
 75-20020a810b4e000000b002f7bc6a9643mr14557804ywl.87.1651571196205; Tue, 03
 May 2022 02:46:36 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 3 May 2022 02:46:35 -0700
From: Andrea Bolognani <abologna@redhat.com>
References: <20220503082748.89847-1-abologna@redhat.com>
 <874k27dmyy.fsf@pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <874k27dmyy.fsf@pond.sub.org>
Date: Tue, 3 May 2022 02:46:35 -0700
Message-ID: <CABJz62OjHMX09YLwsQfynEC_DfQAHm1qy8py4Aes=Ky0LQ+0mQ@mail.gmail.com>
Subject: Re: [PATCH] qapi: Fix incorrect Since tags
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 03, 2022 at 10:44:37AM +0200, Markus Armbruster wrote:
> I posted a more complete fix as "[PATCH] qapi: Fix malformed "Since:"
> section tags", and you even reviewed it :)

Oh boy, I clearly need more coffee. Sorry for the noise :/

-- 
Andrea Bolognani / Red Hat / Virtualization


