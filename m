Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8094CD2E6
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 12:00:29 +0100 (CET)
Received: from localhost ([::1]:44968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ5fg-0003g2-4n
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 06:00:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nQ5de-0002F7-Pw
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:58:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nQ5dd-0004dz-1A
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:58:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646391500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rn2KFOyQtixh6aQ9OkHqeqlYMeSRuuD5cFJqoG4QJTk=;
 b=G1sTc+5t9QII0zHUByxrv21G61WFloWGnrmorgdq4tUOBcqdCXoNDVejMP2A1RzsGNI+Fa
 Q3cYCyqqjT5iI9Ym5i22XXpI7ADeK4iVQXslkLhbTdNO5qgWq5TnaGKmFhXsoV+CpLR0w5
 8lK8QtwyFRBh0lB1qTOU4qLF9QKNnpo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-GyEFPD8-MZmZH99eZrjTkw-1; Fri, 04 Mar 2022 05:58:19 -0500
X-MC-Unique: GyEFPD8-MZmZH99eZrjTkw-1
Received: by mail-ed1-f71.google.com with SMTP id
 b13-20020a056402278d00b0041311e02a9bso4353858ede.13
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 02:58:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rn2KFOyQtixh6aQ9OkHqeqlYMeSRuuD5cFJqoG4QJTk=;
 b=aRCL2au4ZLXu1r/4ITBkQG1w9PB81SEGWXgnQboIAkgwGwYWXOMC62lDld2iCPQ7IA
 NRJbQOPC64ncAoJa0qrTYuOQO/rXgPfF8gxz9IPUFUvNnB8Q8+HdWesrhouCM26hYAC8
 K7qje3r/sS/jvg3ueYwZ4m79sQXMITZQyHhCTEDmAUKJznuXT1M8jJ/+iuPCyp8GU6B9
 pmzB8x6/N8WdR//gr8GUi+R39lctEd02h12CQK/1pyAMSITdE5G2rlxm+WLXNDp4dDwN
 IywghsJ+yRkQfIFIXJedTybbWiSDE/2ghG6scqrNTNGqEfpItOZZgQ/15ioucAtitIBU
 fK4Q==
X-Gm-Message-State: AOAM532WcljNOZNjXR7rUC09aEyLq1sgE56jb4FPIQG24hfP9k8Cq0yQ
 FFVmCUjvpYbqlo5m7rsMkbfMuCjNHGPCRo2bpuTAwWWoFAzUrgWvzs6OvOX4/Zbw2KULicAq1A+
 dcAIrfCHPPDAHOAk=
X-Received: by 2002:a17:906:7d83:b0:6ce:fee:9256 with SMTP id
 v3-20020a1709067d8300b006ce0fee9256mr31796498ejo.647.1646391498165; 
 Fri, 04 Mar 2022 02:58:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxb0xAlr2iPKZhkmfw9Mt2bNrR0GmCWjjH0BtDO92Qc5GWDsNKkgQ43MQHlmGmnb4hg/vNzmQ==
X-Received: by 2002:a17:906:7d83:b0:6ce:fee:9256 with SMTP id
 v3-20020a1709067d8300b006ce0fee9256mr31796481ejo.647.1646391497931; 
 Fri, 04 Mar 2022 02:58:17 -0800 (PST)
Received: from localhost ([185.140.112.229]) by smtp.gmail.com with ESMTPSA id
 z24-20020a170906815800b006dab4bd985dsm677919ejw.107.2022.03.04.02.58.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 02:58:17 -0800 (PST)
Date: Fri, 4 Mar 2022 11:58:16 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Liav Albani <liavalb@gmail.com>
Subject: Re: [PATCH v4 2/3] hw/acpi: add indication for i8042 in IA-PC boot
 flags of the FADT table
Message-ID: <20220304115816.45d289a9@redhat.com>
In-Reply-To: <a9676a57-4ef3-6460-9d8a-8f99e7887047@gmail.com>
References: <20220228201733.714580-1-liavalb@gmail.com>
 <20220228201733.714580-3-liavalb@gmail.com>
 <20220301094354.1d37f470@redhat.com>
 <20220301061131-mutt-send-email-mst@kernel.org>
 <20220301124757.61525849@redhat.com>
 <20220301071112-mutt-send-email-mst@kernel.org>
 <a9676a57-4ef3-6460-9d8a-8f99e7887047@gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: ani@anisinha.ca, shentey@gmail.com, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2 Mar 2022 17:45:58 +0200
Liav Albani <liavalb@gmail.com> wrote:

> >>> but I feel quoting spec
> >>> and including table name is a good idea actually, but pls quote verbatim:  
> >> I don't do that  and don't ask it from others.
> >>
> >> The reason being that pointing where to look in spec and having
> >> verbatim copy of field name is sufficient
> >> for looking it up and
> >> QEMU does not endup with half of spec copied in (+unintentional mistakes).
> >> (As reviewer I will check if whatever written in patch actually matches
> >> spec anyways)
> >>
> >> That's why I typically use
> >>    'spec ver, verbatim field name[, chapter/table name]'
> >> policy. The later optional part is usually used for pointing
> >> to values description.  
> >
> > Ok but here the field name was not listed verbatim, and table name
> > is missing. It is actually 8042 and table name is Fixed ACPI Description
> > Table Boot Architecture Flags.  
> So, in which route should I go with this? I could add a reference to the 
> ACPI spec, but can write and explain more if you want me to.
A reference to spec is sufficient, as long as it is unambiguous and lets
a reviewer easily find it within the spec


