Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B34EE551947
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 14:48:37 +0200 (CEST)
Received: from localhost ([::1]:39510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3GpY-0002ks-66
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 08:48:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3Glc-0000m6-5o
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 08:44:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3GlP-0004XW-Fu
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 08:44:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655729058;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mrpkuJ+ug9lpdvQqFlFDFUXTqTVhGZ2M9cNMaBm9SSE=;
 b=NTGyPa1gztcUw8pNM9Rvr6QZ2LWiZDBLs5R+5LxlSUju+UyrKAK+r/JmaR8XkNmDaWcvQP
 VYl0Iq3nY1lBETdORircAm93k9FN9E8xN6HdQk8curh7b+7SrkRsm/JpCk2qT6a7LWoJ1N
 Iggs9kh0srQwla1Qf6WSedMzyXa/mo8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-18-DbywhfDLMCa5c3LLuXA2uA-1; Mon, 20 Jun 2022 08:44:15 -0400
X-MC-Unique: DbywhfDLMCa5c3LLuXA2uA-1
Received: by mail-wm1-f69.google.com with SMTP id
 ay28-20020a05600c1e1c00b0039c5cbe76c1so6871739wmb.1
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 05:44:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mrpkuJ+ug9lpdvQqFlFDFUXTqTVhGZ2M9cNMaBm9SSE=;
 b=uMqBF0Mdy9EekhJ3D0QfU6b6Ni47ipFjTrtGKLaCl4wGSHifl/FRVbSgs3ccoif3Jd
 3gdC1D66cJ33DdQqtR9659TMAJq2TGIxFG5vIEbNXPtXs6L06TxvC2QiLF9cVWsx/B9Z
 d0hY+S3jS8PtfkDsx1iTGcpivrOYZS1aZfr+Ktqf2sdQHyINrThCZbor0Wn8JloihML3
 OfOhk3d8wwTyq+wVAbnuVplZPbPWShNTMa3XmSXnp8Eq77JUJXiiMebg81cnZGyN61m9
 5fB2LLETMZxtd+eINfC2l0+uPqrogxmJdE4nBsr0RDmN1v9RXMMhIFviTGO898BTm1TH
 J0hg==
X-Gm-Message-State: AJIora/QxwEzbb0XgkhTwPH3VUISQcYilHo9bh2Wn8DCcU+wL6nk4qu2
 qNkdFUQZcuvrE3uVmXhrbQzTXYCaUu+eEFHlWBGaPXXtwktmbstlKebaKSPFI3wXjnjPrALzsl1
 t6BOCPxKDYGbs0Xk=
X-Received: by 2002:a5d:6786:0:b0:215:3cb5:b16c with SMTP id
 v6-20020a5d6786000000b002153cb5b16cmr23008045wru.6.1655729054066; 
 Mon, 20 Jun 2022 05:44:14 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tlUwHTiGmO5ajCR0liTpaqAiQaFQbV20PLKw2ywaMeXtHETQbmWmRutQ8xukiAIB8QL/9xBQ==
X-Received: by 2002:a5d:6786:0:b0:215:3cb5:b16c with SMTP id
 v6-20020a5d6786000000b002153cb5b16cmr23008025wru.6.1655729053840; 
 Mon, 20 Jun 2022 05:44:13 -0700 (PDT)
Received: from localhost ([212.145.226.77]) by smtp.gmail.com with ESMTPSA id
 o18-20020a05600c511200b0039c55bc2c97sm19215141wms.16.2022.06.20.05.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 05:44:13 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,  qemu-block@nongnu.org,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Stefan Hajnoczi <stefanha@redhat.com>,  Hailiang
 Zhang <zhang.zhanghailiang@huawei.com>,  Fam Zheng <fam@euphon.net>,
 Hailiang Zhang <zhanghailiang@xfusion.com>
Subject: Re: [PATCH v2 01/21] io: add a QIOChannelNull equivalent to /dev/null
In-Reply-To: <20220620110205.1357829-2-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Mon, 20 Jun 2022 12:01:45
 +0100")
References: <20220620110205.1357829-1-berrange@redhat.com>
 <20220620110205.1357829-2-berrange@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 20 Jun 2022 14:44:11 +0200
Message-ID: <87fsjz4i90.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> This is for code which needs a portable equivalent to a QIOChannelFile
> connected to /dev/null.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


