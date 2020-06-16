Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A171FB0D4
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 14:35:41 +0200 (CEST)
Received: from localhost ([::1]:48380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlAoW-0004Pm-F4
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 08:35:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jlAl5-0000xP-OU
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 08:32:08 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:23892
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jlAkt-00052v-Nb
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 08:32:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592310713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m9AXSeX5xIkJ3UUPH3ig+R68TNnlcy7TUGSiJzPw30k=;
 b=IZkspfNQZ1LaEm8nV7D9tskyMFreUHnxYLH1LlmJeXDrpJzQo640z4sMnJpspzj4Pob5SD
 Wv6+LzGPNZG2HKaudsvVR9aGdmLwiINUuVVKDdyyRSFfhrUsJkdXiqOtzQW5eAO5W+VAYl
 2As3N7dLYmlW6k9i2nVfi9Xp1lEoxG8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-LBNHN-PzOhi6cuuav7jHOw-1; Tue, 16 Jun 2020 08:31:52 -0400
X-MC-Unique: LBNHN-PzOhi6cuuav7jHOw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A783835B7C;
 Tue, 16 Jun 2020 12:31:51 +0000 (UTC)
Received: from [10.36.114.197] (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E6D08101E675;
 Tue, 16 Jun 2020 12:31:48 +0000 (UTC)
Subject: Re: [PATCH v2 1/5] tpm_tis: Allow lowering of IRQ also when locality
 is not active
To: Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-devel@nongnu.org
References: <20200615142327.671546-1-stefanb@linux.vnet.ibm.com>
 <20200615142327.671546-2-stefanb@linux.vnet.ibm.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <14b3f62b-3aa0-1b18-c39e-ef2902826bb9@redhat.com>
Date: Tue, 16 Jun 2020 14:31:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200615142327.671546-2-stefanb@linux.vnet.ibm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/16 02:46:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: marcandre.lureau@redhat.com, Stefan Berger <stefanb@linux.ibm.com>,
 philmd@redhat.com, mkedzier@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Stefan,

On 6/15/20 4:23 PM, Stefan Berger wrote:
> From: Stefan Berger <stefanb@linux.ibm.com>
> 
> This patch fixes a bug that occurs when using interrupts. It
> allows to lower the IRQ also when a locality is not active.
> 
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> ---

>  hw/tpm/tpm_tis_common.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/hw/tpm/tpm_tis_common.c b/hw/tpm/tpm_tis_common.c
> index 1af4bce139..0f42696f1f 100644
> --- a/hw/tpm/tpm_tis_common.c
> +++ b/hw/tpm/tpm_tis_common.c
> @@ -601,10 +601,6 @@ static void tpm_tis_mmio_write(void *opaque, hwaddr addr,
>          /* hard wired -- ignore */
>          break;
>      case TPM_TIS_REG_INT_STATUS:
> -        if (s->active_locty != locty) {
> -            break;
> -        }
> -
>          /* clearing of interrupt flags */
>          if (((val & TPM_TIS_INTERRUPTS_SUPPORTED)) &&
>              (s->loc[locty].ints & TPM_TIS_INTERRUPTS_SUPPORTED)) {
> 


