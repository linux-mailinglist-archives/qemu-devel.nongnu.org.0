Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D800D6A8DC6
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 01:16:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXt5d-0005ZN-TA; Thu, 02 Mar 2023 19:16:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXt5Q-0005QJ-A1
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 19:15:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXt5O-0005qF-DK
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 19:15:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677802545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5cdPu15UBe7KTDb3QtbGXBpMSA7rh9Jg/65kItOkgBo=;
 b=QmbAlUqtRzQZ++OIkws4aOYCEXstEVwLMSBoLx0luduPZ3s0WWCFTE/ndLkTBl/Xkp9Fqh
 5WRYTxZ2Yh4m4ZqISp524oeIHzyTxZ9QcpudkMVJLpoGmdqrZUuvfndCozUkoolSNRwL49
 5Z7NMhFbyN8dDkiWjdGsY6RhBaSs3Sw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-61-HseHFADJPLSLiCx3FQMK-g-1; Thu, 02 Mar 2023 19:15:44 -0500
X-MC-Unique: HseHFADJPLSLiCx3FQMK-g-1
Received: by mail-wm1-f71.google.com with SMTP id
 j6-20020a05600c1c0600b003eaf882cb85so274874wms.9
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 16:15:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677802543;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5cdPu15UBe7KTDb3QtbGXBpMSA7rh9Jg/65kItOkgBo=;
 b=lpkk6kt1iYoZaKuEWdMoXzcA0m0TDkjBAMUQrDCQKPpQh4Zbf4by2YnUs2LP/55oG4
 OPZdmEzWFkVAFMloSbZjG0GeiOa6HaM2mp7jvD/BjsZlJhhsFuX0RQJUlrSJakbaSOUU
 EPU8cH8nPL1EZV+gS2z70AgVuPDq9JmgI4soVp3zUeGxFyrxoFJxZQwAOLvb7n3e9ak/
 YdpJEK7PjH3gZnz6sCM634iPvkrC3v5Y39AJAqSJuFqGgKvUKm6O5nImTXnbr53J9y1a
 aUcURon1sK89mhcd7jAAATOiF9RpQiAb8RYajxApxL4MjAxsngb+xco1GoTEGyOFH7px
 z/ig==
X-Gm-Message-State: AO0yUKVMc6BtGvmQYw/Vyni76NXpZVFSxmDy3rsQkLBCVNYji9Mt2DHT
 76LPGKdNXWAURYWzZDEb6UQ6nPBImwmU228wkAIGHru5oQm5bf/mwan2kehnXCJU/gfkwj8FLaw
 yhBG4mA3LSe6B0Do=
X-Received: by 2002:a05:600c:1c1d:b0:3e9:c2f4:8ad4 with SMTP id
 j29-20020a05600c1c1d00b003e9c2f48ad4mr9006055wms.8.1677802543340; 
 Thu, 02 Mar 2023 16:15:43 -0800 (PST)
X-Google-Smtp-Source: AK7set9ckGH2+YUYENIn1+Mqzss73zFzD2Ys7Kb1MOHf0JONFijCzcGAK/RT+hltp/VZQdtdSm9++w==
X-Received: by 2002:a05:600c:1c1d:b0:3e9:c2f4:8ad4 with SMTP id
 j29-20020a05600c1c1d00b003e9c2f48ad4mr9006044wms.8.1677802543006; 
 Thu, 02 Mar 2023 16:15:43 -0800 (PST)
Received: from redhat.com ([2a06:c701:742d:fd00:c847:221d:9254:f7ce])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a7bcd0d000000b003db01178b62sm4260299wmj.40.2023.03.02.16.15.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 16:15:42 -0800 (PST)
Date: Thu, 2 Mar 2023 19:15:39 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Yajun Wu <yajunw@nvidia.com>, Jiri Pirko <jiri@nvidia.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Yajun@redhat.com, Wu@redhat.com, &lt@redhat.com, Jiri@redhat.com,
 Pirko@redhat.com, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PULL 35/53] chardev/char-socket: set s->listener = NULL in
 char_socket_finalize
Message-ID: <20230302191519-mutt-send-email-mst@kernel.org>
References: <20230302082343.560446-1-mst@redhat.com>
 <20230302082343.560446-36-mst@redhat.com>
 <fd95f235-b43e-f908-887e-b6b57aa5c4f4@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fd95f235-b43e-f908-887e-b6b57aa5c4f4@msgid.tls.msk.ru>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Thu, Mar 02, 2023 at 02:49:56PM +0300, Michael Tokarev wrote:
> There are some url'ifications slipped into this one:
> 
> 02.03.2023 11:26, Michael S. Tsirkin пишет:
> ..
> 
> > Message-Id: <20230214021430.3638579-1-yajunw@nvidia.com>
> > Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> > Signed-off-by: Yajun Wu &lt;<a href="mailto:yajunw@nvidia.com" target="_blank">yajunw@nvidia.com</a>&gt;<br>
> > Acked-by: Jiri Pirko &lt;<a href="mailto:jiri@nvidia.com" target="_blank">jiri@nvidia.com</a>&gt;<br></blockquote><div><br></div><div>Reviewed-by: Marc-André Lureau &lt;<a href="mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;<br><br> </div><blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
> 
> 
> Thanks,
> 
> /mjt

Ugh yack. how did this happen - no idea.
Fixed now thanks!


