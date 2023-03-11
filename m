Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 074F96B60CA
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Mar 2023 22:00:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pb6JD-0007o8-UH; Sat, 11 Mar 2023 15:59:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pb6J9-0007nq-TK
 for qemu-devel@nongnu.org; Sat, 11 Mar 2023 15:59:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pb6J8-0007tQ-0A
 for qemu-devel@nongnu.org; Sat, 11 Mar 2023 15:59:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678568352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/hox0GWLyAUulgnOCP9kaOfu7Q0cujTZY8qguo0zp+M=;
 b=ipU4SV9z/YStx0y0PHwTcl2OVHB5PggWtkJxCc1NZV9wr7yy/S2hAioNMK8++Bu+NlOXf8
 k46QvC6i/CnY0Q89HEUvuiMjO09mxzgfpDt7G01kMGzYQx5bUZXBUUfkszNgJvtfHyFgfq
 8VxN2NulIbfyAdrf/zvVehjPKFI9ogk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-184-d4_f52A4N8W8mQXNxmu8Yw-1; Sat, 11 Mar 2023 15:59:09 -0500
X-MC-Unique: d4_f52A4N8W8mQXNxmu8Yw-1
Received: by mail-wr1-f69.google.com with SMTP id
 u5-20020a5d6da5000000b002cd82373455so1568314wrs.9
 for <qemu-devel@nongnu.org>; Sat, 11 Mar 2023 12:59:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678568348;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/hox0GWLyAUulgnOCP9kaOfu7Q0cujTZY8qguo0zp+M=;
 b=nFNAh7RT7AOgAFDHOFMCZBeba3u6EjNcGj5VkodTtuE4DXvwz719QfjhWWMhmFNpRl
 oturZzxh35tSEPptV/qr3Z1/JTPMQWg+itwZjQVw94QdISdlGnka9QSAMf59Uolhd2TZ
 HHhUnX/neJ7B8Qt7GAMSG+x8b8/pRXgWBk7Wu+fKW+/tGS52bTnHq9rD2bhZGi/l5DE7
 oVnLWtkXv3tE9UcLj59BxWahG8f+FL/PbGShEKHbVyFJY4c2YKug8jWULsN0Ioe08lMF
 UaLbRBUraLP2REA3CbIzb10vXRKbjOIBXnd8bq4m/bQh3f6rQ8f060qHyPlSgTnq4UmE
 Kiyw==
X-Gm-Message-State: AO0yUKWPBP2jzUtln25Q8rhhhdM3D6PminTLQ+6LhGKlCjOrQIGfIMUk
 KodZzKkH2y1fEkni4zx3/NuKD413lAeAVmTM7iwSPQ+XGp2OrXgDqOZBmjyPn14a4Zvyx0oW1tM
 qo70yXEgbFsn8NBw=
X-Received: by 2002:a05:600c:3c9e:b0:3ed:1f7f:bbbd with SMTP id
 bg30-20020a05600c3c9e00b003ed1f7fbbbdmr1022049wmb.9.1678568348323; 
 Sat, 11 Mar 2023 12:59:08 -0800 (PST)
X-Google-Smtp-Source: AK7set/NINgdcq04hd0hFb866I/DUTH8pBh5iUgm17IcHLGo3I47HbsICd/EMTXWSQG6Ewm9hguKdw==
X-Received: by 2002:a05:600c:3c9e:b0:3ed:1f7f:bbbd with SMTP id
 bg30-20020a05600c3c9e00b003ed1f7fbbbdmr1022038wmb.9.1678568348019; 
 Sat, 11 Mar 2023 12:59:08 -0800 (PST)
Received: from redhat.com ([2.52.29.35]) by smtp.gmail.com with ESMTPSA id
 e2-20020a5d5002000000b002c567b58e9asm3274187wrt.56.2023.03.11.12.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Mar 2023 12:59:06 -0800 (PST)
Date: Sat, 11 Mar 2023 15:59:03 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: BALATON Zoltan <balaton@eik.bme.hu>,
 Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH] hw/acpi: Set memory regions to native endian as a work
 around
Message-ID: <20230311155807-mutt-send-email-mst@kernel.org>
References: <b0787bca-8321-059e-d360-1e0a0af31228@redhat.com>
 <a7992420-e2e3-7859-b2de-f9aa88c94945@redhat.com>
 <d03380e9-b6a2-5998-cc72-6443cfdc46b5@eik.bme.hu>
 <d9fcba9d-c2c6-5be3-ce5f-baf5a116bbc4@eik.bme.hu>
 <20220119041842-mutt-send-email-mst@kernel.org>
 <20220222094021-mutt-send-email-mst@kernel.org>
 <f9f183c4-b0b8-22c6-57f9-1b6b20e8e5a5@eik.bme.hu>
 <20230220172659-mutt-send-email-mst@kernel.org>
 <f4e755b6-051e-103f-b8bc-2765d277633f@eik.bme.hu>
 <e3a19d91-b9ef-9352-8f60-35432fdf5d1e@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e3a19d91-b9ef-9352-8f60-35432fdf5d1e@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Feb 21, 2023 at 09:30:34AM +0100, Paolo Bonzini wrote:
> The case of impl.min_access_size < valid.min_access_size is not
> supported in the memory core.

Did you mean > here?

-- 
MST


