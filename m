Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1F552B491
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 10:25:40 +0200 (CEST)
Received: from localhost ([::1]:38510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrEzz-0004Bi-DC
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 04:25:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nrEyd-0003Mg-G4
 for qemu-devel@nongnu.org; Wed, 18 May 2022 04:24:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nrEyb-0006cW-0l
 for qemu-devel@nongnu.org; Wed, 18 May 2022 04:24:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652862252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=d3H2QPE4OKt2ACSlF8tX+rNTOnc+lFsBGcBo0gCrpGA=;
 b=QQfFkncnjF418ITdBS4nqj4VRK71V/qDn9nfF/fyJ8omBNCGxNUp2p4ZjTSmIgpZ6+SUrf
 +Vz1Mm2r4chytQ+gwIo+VKeZoDitXy/hkEXlDz4I9s0RNEVoc07h3cyRfdTj383gWg8o0P
 32NiJViGNJCFoj0iDLXFK8oNBTFmb9c=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-277-KS8DnsD2M9SoRbgB-y30Iw-1; Wed, 18 May 2022 04:24:10 -0400
X-MC-Unique: KS8DnsD2M9SoRbgB-y30Iw-1
Received: by mail-wm1-f72.google.com with SMTP id
 h6-20020a7bc926000000b0039470bcb9easo485239wml.1
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 01:24:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=d3H2QPE4OKt2ACSlF8tX+rNTOnc+lFsBGcBo0gCrpGA=;
 b=Dk5JZM+wG107GzbxN6q4e+7bnJb726UrfA8VpBOODekkkvWu01v9qEOVEUitcfBf+C
 rTPAY3tmJznFlPrGt0y9LBH7H6BsTIXCcN+/2jW+P5tszOJm/OH7obFxvABfkT8Q1B9P
 29vWLrqde6LUKF9FjnK3mMIRm0/MmKRQUtJ93GOyXmCTDvObXiNx2ZjzryG2xZ7W3ZDX
 HsmgYHY8qTa5gxQBO9XmKrn4gtXgfAihJp5+kGgFi2duRnxPuRtIBwS9o9pTsumRlDAE
 uOvDkRz+HySjuraL2nDf3bP/MUuI8qC/lN6sxnZS5tSa8N9US+FLobJpSvRU0rYLsTBh
 E1NQ==
X-Gm-Message-State: AOAM533XNQYoen2kC5853eoU0Urgu/pOtrF0daIpDjeyWfqVMtlx6hTC
 DFWfLxZfiafrhvpADeD7Y+Ocxr6NmO/lH/3uoeoI2lj2A2SNlHMwMvkoPwTA3M4i3Z5amL2SVSz
 NePmziAAWBrAPA3o=
X-Received: by 2002:a05:600c:2210:b0:393:ffb8:2985 with SMTP id
 z16-20020a05600c221000b00393ffb82985mr34743908wml.167.1652862249392; 
 Wed, 18 May 2022 01:24:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxjUUdSeKcERix+VUDCESgAz0TDMNpluGKz2l/mAW3+5lq9ZKtxtuKWF85wgNI/TKAj/or7A==
X-Received: by 2002:a05:600c:2210:b0:393:ffb8:2985 with SMTP id
 z16-20020a05600c221000b00393ffb82985mr34743893wml.167.1652862249067; 
 Wed, 18 May 2022 01:24:09 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 x6-20020a7bc766000000b003942a244f50sm3788890wmk.41.2022.05.18.01.24.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 01:24:08 -0700 (PDT)
Date: Wed, 18 May 2022 09:24:06 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: berrange@redhat.com, leobras@redhat.com
Cc: qemu-devel@nongnu.org
Subject: Re: New Defects reported by Coverity Scan for QEMU
Message-ID: <YoStJsVtyKVdLdVL@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FAKE_REPLY_C=1.486, RCVD_IN_DNSWL_LOW=-0.7, SENDGRID_REDIR=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

(Resend with correct address)
Hi Dan, Leo,
  There are a few coverity warns from that last series:


Two moans about not checking mkdir in the tls tests:
> ** CID 1488871:  Error handling issues  (CHECKED_RETURN)
> /qemu/tests/qtest/migration-test.c: 782 in test_migrate_tls_x509_start_common()
> 
> 
> ________________________________________________________________________________________________________
> *** CID 1488871:  Error handling issues  (CHECKED_RETURN)
> /qemu/tests/qtest/migration-test.c: 782 in test_migrate_tls_x509_start_common()
> 776         data->servercert = g_strdup_printf("%s/server-cert.pem", data->workdir);
> 777         if (args->clientcert) {
> 778             data->clientkey = g_strdup_printf("%s/client-key.pem", data->workdir);
> 779             data->clientcert = g_strdup_printf("%s/client-cert.pem", data->workdir);
> 780         }
> 781     
> >>>     CID 1488871:  Error handling issues  (CHECKED_RETURN)
> >>>     Calling "mkdir(data->workdir, 448U)" without checking return value. This library function may fail and return an error code.
> 782         mkdir(data->workdir, 0700);
> 783     
> 784         test_tls_init(data->keyfile);
> 785         g_assert(link(data->keyfile, data->serverkey) == 0);
> 786         if (args->clientcert) {
> 787             g_assert(link(data->keyfile, data->clientkey) == 0);
> 
> ** CID 1488870:    (CHECKED_RETURN)
> /qemu/tests/qtest/migration-test.c: 677 in test_migrate_tls_psk_start_common()
> /qemu/tests/qtest/migration-test.c: 670 in test_migrate_tls_psk_start_common()
> 
> 
> ________________________________________________________________________________________________________
> *** CID 1488870:    (CHECKED_RETURN)
> /qemu/tests/qtest/migration-test.c: 677 in test_migrate_tls_psk_start_common()
> 671         test_tls_psk_init(data->pskfile);
> 672     
> 673         if (mismatch) {
> 674             data->workdiralt = g_strdup_printf("%s/tlscredspskalt0", tmpfs);
> 675             data->pskfilealt = g_strdup_printf("%s/%s", data->workdiralt,
> 676                                                QCRYPTO_TLS_CREDS_PSKFILE);
> >>>     CID 1488870:    (CHECKED_RETURN)
> >>>     Calling "mkdir(data->workdiralt, 448U)" without checking return value. This library function may fail and return an error code.
> 677             mkdir(data->workdiralt, 0700);
> 678             test_tls_psk_init_alt(data->pskfilealt);
> 679         }
> 680     
> 681         rsp = wait_command(from,
> 682                            "{ 'execute': 'object-add',"
> /qemu/tests/qtest/migration-test.c: 670 in test_migrate_tls_psk_start_common()
> 664             g_new0(struct TestMigrateTLSPSKData, 1);
> 665         QDict *rsp;
> 666     
> 667         data->workdir = g_strdup_printf("%s/tlscredspsk0", tmpfs);
> 668         data->pskfile = g_strdup_printf("%s/%s", data->workdir,
> 669                                         QCRYPTO_TLS_CREDS_PSKFILE);
> >>>     CID 1488870:    (CHECKED_RETURN)
> >>>     Calling "mkdir(data->workdir, 448U)" without checking return value. This library function may fail and return an error code.
> 670         mkdir(data->workdir, 0700);
> 671         test_tls_psk_init(data->pskfile);
> 672     
> 673         if (mismatch) {
> 674             data->workdiralt = g_strdup_printf("%s/tlscredspskalt0", tmpfs);
> 675             data->pskfilealt = g_strdup_printf("%s/%s", data->workdiralt,
> 
> ** CID 1488869:  Insecure data handling  (TAINTED_SCALAR)
> /qemu/io/channel-socket.c: 716 in qio_channel_socket_flush()



This one is more curious:
> *** CID 1488869:  Insecure data handling  (TAINTED_SCALAR)
> /qemu/io/channel-socket.c: 716 in qio_channel_socket_flush()
> 710         int ret = 1;
> 711     
> 712         msg.msg_control = control;
> 713         msg.msg_controllen = sizeof(control);
> 714         memset(control, 0, sizeof(control));
> 715     
> >>>     CID 1488869:  Insecure data handling  (TAINTED_SCALAR)
> >>>     Using tainted variable "sioc->zero_copy_sent" as a loop boundary.
> 716         while (sioc->zero_copy_sent < sioc->zero_copy_queued) {
> 717             received = recvmsg(sioc->fd, &msg, MSG_ERRQUEUE);
> 718             if (received < 0) {
> 719                 switch (errno) {
> 720                 case EAGAIN:
> 721                     /* Nothing on errqueue, wait until something is available */

it's not clear to me why it considers that 'insecure'; is that because
it's using values returned by the recvmsg ???

Dave

> 
> ** CID 1488868:  Integer handling issues  (OVERFLOW_BEFORE_WIDEN)
> /qemu/include/hw/cxl/cxl_component.h: 218 in cxl_decode_ig()
> 
> 
> ________________________________________________________________________________________________________
> *** CID 1488868:  Integer handling issues  (OVERFLOW_BEFORE_WIDEN)
> /qemu/include/hw/cxl/cxl_component.h: 218 in cxl_decode_ig()
> 212     
> 213     uint8_t cxl_interleave_ways_enc(int iw, Error **errp);
> 214     uint8_t cxl_interleave_granularity_enc(uint64_t gran, Error **errp);
> 215     
> 216     static inline hwaddr cxl_decode_ig(int ig)
> 217     {
> >>>     CID 1488868:  Integer handling issues  (OVERFLOW_BEFORE_WIDEN)
> >>>     Potentially overflowing expression "1 << ig + 8" with type "int" (32 bits, signed) is evaluated using 32-bit arithmetic, and then used in a context that expects an expression of type "hwaddr" (64 bits, unsigned).
> 218         return 1 << (ig + 8);
> 219     }
> 220     
> 221     CXLComponentState *cxl_get_hb_cstate(PCIHostState *hb);
> 222     
> 
> 
> ________________________________________________________________________________________________________
> To view the defects in Coverity Scan visit, https://u15810271.ct.sendgrid.net/ls/click?upn=HRESupC-2F2Czv4BOaCWWCy7my0P0qcxCbhZ31OYv50yrzEQNXe51mg-2FlKoEnRoarMq5nOxxfhqLUuo8HvG2S4Ew-3D-3DsJiM_-2BVwspb-2FvVsiDHi6TjJb1RCVMbxW4dUuL9sNVe8y5Hw33niByDzIZpGAOA5aYVSqv5jZRKaysoHO8HDAwcefdRpS6APFciD-2BwrlJOuA5BQE0BdpVQ-2F2N4H1eMXpy9YdBkXKlWx-2FEjNzp4PFxHatEl0DUHK-2BmMHOAPpvs5sC8wiJnoEK-2FOHDrJRemKeQ9jYmHtYSxFL21EDsvDKE-2FaIvXgh2BZ1DIuERrQlniBGfoVsYI-3D
> 
>   To manage Coverity Scan email notifications for "dgilbert@redhat.com", click https://u15810271.ct.sendgrid.net/ls/click?upn=HRESupC-2F2Czv4BOaCWWCy7my0P0qcxCbhZ31OYv50yped04pjJnmXOsUBtKYNIXx81NaqhEuFta67QJjvrT4RaVMQaGq-2BvVMlKibSYlsRsVMlpoQjDNxxnuHxr4ePPs-2BGw9e2Rwvy7HI6fIypkgcFLOSiaVl1GR5WZgeKL5Lc28-3DX0rx_-2BVwspb-2FvVsiDHi6TjJb1RCVMbxW4dUuL9sNVe8y5Hw33niByDzIZpGAOA5aYVSqvTnKwL62mXPLveeP-2BWUfRx5fh6FkZ4ip8kt9FOWgTvKnwBEgRG9Hd6pRry4YHYry9Link-2B-2FJaxPuPjvtUPJC-2FjaH8m4iuyJBAq1vyM0bUUjuOwaUkIo9d-2F5qAkATC9CFkabYArjrgzBzYyi9I4oa04-2B1XLhr2wHE07h56XDN37Gw-3D
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


