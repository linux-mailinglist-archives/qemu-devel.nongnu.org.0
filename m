Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A713E1E7F
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 00:14:26 +0200 (CEST)
Received: from localhost ([::1]:43496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBldB-0000ja-8V
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 18:14:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mBlcO-0008VZ-Tx
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 18:13:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mBlcM-00034D-2b
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 18:13:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628201610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XkgiJdlGCnCROlBVkszbMjS2498F6K+nIAjvuCfdc0c=;
 b=FlJGvjYiRwfEmnD1OYENgnS7L5X8N8Gto3CoTkdhJESxBUdKvVrPKh4FORsNqUujPZfhEi
 8i0yWLqOrihMY/yYBUK38gbKLug3qIkLfaH6zRW+WjZleNhFt7nROPB4mMKPY12RXsDhGn
 XW7eQe9nTt0IewMlgGenkBL5pJxWW60=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-DckF6hPGOw2cIwQw5InD7w-1; Thu, 05 Aug 2021 18:13:29 -0400
X-MC-Unique: DckF6hPGOw2cIwQw5InD7w-1
Received: by mail-ej1-f71.google.com with SMTP id
 lu19-20020a170906fad3b029058768348f55so2534349ejb.12
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 15:13:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XkgiJdlGCnCROlBVkszbMjS2498F6K+nIAjvuCfdc0c=;
 b=nDR1Kw2LqsZK4UIDaDANuV3w6NcjJqGY+/ZQW+Ilc8WyfiTyh5muDtogKDpxOss737
 FfssxPABkZuy3mYHiPmKM2PVdw0k/hfp0fRQbcbttLTxjCHYDoVBru4bVgCL5FCKTmpu
 yBdO7nI7XTsJnYLrzBx2pkhl7orrbRaYJBl2xAzVOQ3BWsY2ZQzDOROf9gWZqrXWIS1F
 5hn0xhUFwhJwJwq+7Ai+Py93hHCPjj1pvd8MBrmpz4Mmi1yIDnXKMxva0MzxQMyOP2PR
 zHLPW0qgv00Qj13Xi2VZfy7KlUtEP45MuMOt3sbu5YSmsRSMf1wx/DAP5QWl52MEamUW
 CSGg==
X-Gm-Message-State: AOAM531P+bmXhn1TCZFPTj0Huxeyy4Fj0GzRM04HoWJhamag3deGyFli
 24WrSyrKt20feeVe7e3ZD8NWgLmIgvv8go2D/Blfzac5mmKak0Hy4sothUZO9EWybqOZp+OrBg4
 NEj+mHwvYHZ0ojmg=
X-Received: by 2002:aa7:d70b:: with SMTP id t11mr6702801edq.20.1628201608304; 
 Thu, 05 Aug 2021 15:13:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQiqvxVKL5yvTY6nRDgn2YrG+gmDhbniizx3h5BqEeKMQdheKM3TgJFPeoTreV4+QZJIJkKg==
X-Received: by 2002:aa7:d70b:: with SMTP id t11mr6702778edq.20.1628201608077; 
 Thu, 05 Aug 2021 15:13:28 -0700 (PDT)
Received: from redhat.com ([2.55.141.248])
 by smtp.gmail.com with ESMTPSA id c22sm2960847eds.1.2021.08.05.15.13.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 15:13:25 -0700 (PDT)
Date: Thu, 5 Aug 2021 18:13:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH v3] hw/acpi: add an assertion check for non-null return
 from acpi_get_i386_pci_host
Message-ID: <20210805180915-mutt-send-email-mst@kernel.org>
References: <20210726165743.232073-1-ani@anisinha.ca>
 <20210805111543.5fb99abf@redhat.com>
 <alpine.DEB.2.22.394.2108051705240.291909@anisinha-lenovo>
 <alpine.DEB.2.22.394.2108051826190.291909@anisinha-lenovo>
 <alpine.DEB.2.22.394.2108051938340.329433@anisinha-lenovo>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2108051938340.329433@anisinha-lenovo>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, jusual@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 05, 2021 at 07:42:35PM +0530, Ani Sinha wrote:
> Also to be noted that there is a stub for acpi_get_i386_pci_host() which
> simply returns NULL. This activates when CONFIG_PC is disabled. It is this
> stub that gets called for mips and hence the check for non-null host is
> needed in acpi_set_pci_info() function.
> 

Frankly this is generating more discussion that it's worth imho.
IMHO these tweaks will bring little benefit.
Igor do you feel differently?

-- 
MST


