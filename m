Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D04461528F
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 20:53:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opxId-0006Co-KJ; Tue, 01 Nov 2022 15:51:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opxIb-0006CL-50
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 15:51:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opxIX-0004t4-LE
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 15:51:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667332304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mmnXpr+XRFWrbtogAPQBNDnkiX05Ebd8OZW/HSacRkg=;
 b=hcE4w+l7DQRoX+O915Alz0fp76dBVALStVY+hhJe81bh3+V2rR0zaEFWrXlWrkidGyj+iD
 TKAvULKc6NnIke5in7NSq6YZduYuuZjcEwVIZ8EKSYW2y6hXAIxDlAqiC6PbCLxkYLxmYJ
 O3Bt+415EBHSWSIViaB52BlzvoJuvKE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-524-C1v1yPSfPr2db83V9e5F-w-1; Tue, 01 Nov 2022 15:51:42 -0400
X-MC-Unique: C1v1yPSfPr2db83V9e5F-w-1
Received: by mail-wm1-f69.google.com with SMTP id
 62-20020a1c0241000000b003cf6fce8005so606528wmc.9
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 12:51:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mmnXpr+XRFWrbtogAPQBNDnkiX05Ebd8OZW/HSacRkg=;
 b=FG7kXLFmd+uzXQWo/nHunn4C7evQGTBCiwuI/3j8OjsxEYR3TCnTobKcUfpPLzsALQ
 P4c2xEBnMvHMrr7PTuXyIYMDjy6RtUclfpSsJw/4w6RHshwXf8JbwRAQDZEcKNXFNDhJ
 v7O2zKTta+5tua3yH2NAfVTTraUBbbbsX3uPAJoPtND8/qKk3c+d6GD55Wq3rUE9B8XE
 zo84WAPcz3cEwJV82ATnAPxMPunV7svDcCUQ28K1CEArCDd+w49h7Wbi0fHOFeaqW3Xf
 ySj0G1XN3bNJqLRVwI8aXN3w/LWQuW1Ram/M0Ogz/vfzEG/zT/kBvBjUGVUyGKGZs8fk
 SU1g==
X-Gm-Message-State: ACrzQf3gSp7DsgI39kVZgaJWd0V2O3oOIvbNivtIPXW46fVTukEsr0oK
 ri7ANU1SvVVozgVqw5c6ohwkmaOkmwU9eoSsyNQ4DCqTzSVUTQSGe94/PEQbGA1lJDyWmFab7CD
 2wimbxANTufFH02g=
X-Received: by 2002:a05:600c:3b87:b0:3cf:59ea:ea26 with SMTP id
 n7-20020a05600c3b8700b003cf59eaea26mr17269773wms.159.1667332301243; 
 Tue, 01 Nov 2022 12:51:41 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5UjVLaHUfAq7Afu/FboUlh0zEl1Fb9soj5utj6vH0Iugph3nQc0xqcTcJSIrvXPPqu/80eEw==
X-Received: by 2002:a05:600c:3b87:b0:3cf:59ea:ea26 with SMTP id
 n7-20020a05600c3b8700b003cf59eaea26mr17269735wms.159.1667332300555; 
 Tue, 01 Nov 2022 12:51:40 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 k5-20020a05600c0b4500b003c6c4639ac6sm11267169wmr.34.2022.11.01.12.51.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 12:51:39 -0700 (PDT)
Date: Tue, 1 Nov 2022 15:51:36 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Lei He <helei.sig11@bytedance.com>
Cc: berrange@redhat.com, arei.gonglei@huawei.com, pizhenwei@bytedance.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2 1/4] virtio-crypto: Support asynchronous mode
Message-ID: <20221101154944-mutt-send-email-mst@kernel.org>
References: <20221008085030.70212-1-helei.sig11@bytedance.com>
 <20221008085030.70212-2-helei.sig11@bytedance.com>
 <20221101063515-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221101063515-mutt-send-email-mst@kernel.org>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.051,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Nov 01, 2022 at 06:37:26AM -0400, Michael S. Tsirkin wrote:
> On Sat, Oct 08, 2022 at 04:50:27PM +0800, Lei He wrote:
> > virtio-crypto: Modify the current interface of virtio-crypto
> > device to support asynchronous mode.
> > 
> > Signed-off-by: lei he <helei.sig11@bytedance.com>
> > ---
> >  backends/cryptodev-builtin.c    |  69 ++++++---
> >  backends/cryptodev-vhost-user.c |  51 +++++--
> >  backends/cryptodev.c            |  44 +++---
> >  hw/virtio/virtio-crypto.c       | 324 ++++++++++++++++++++++------------------
> >  include/sysemu/cryptodev.h      |  60 +++++---
> >  5 files changed, 336 insertions(+), 212 deletions(-)
> > 
> > diff --git a/backends/cryptodev-builtin.c b/backends/cryptodev-builtin.c
> > index 125cbad1d3..cda6ca3b71 100644
> > --- a/backends/cryptodev-builtin.c
> > +++ b/backends/cryptodev-builtin.c
> > @@ -355,42 +355,62 @@ static int cryptodev_builtin_create_akcipher_session(
> >      return index;
> >  }
> >  
> > -static int64_t cryptodev_builtin_create_session(
> > +static int cryptodev_builtin_create_session(
> >             CryptoDevBackend *backend,
> >             CryptoDevBackendSessionInfo *sess_info,
> > -           uint32_t queue_index, Error **errp)
> > +           uint32_t queue_index,
> > +           CryptoDevCompletionFunc cb,
> > +           void *opaque)
> >  {
> >      CryptoDevBackendBuiltin *builtin =
> >                        CRYPTODEV_BACKEND_BUILTIN(backend);
> >      CryptoDevBackendSymSessionInfo *sym_sess_info;
> >      CryptoDevBackendAsymSessionInfo *asym_sess_info;
> > +    int ret, status;
> > +    Error *local_error = NULL;
> >  
> >      switch (sess_info->op_code) {
> >      case VIRTIO_CRYPTO_CIPHER_CREATE_SESSION:
> >          sym_sess_info = &sess_info->u.sym_sess_info;
> > -        return cryptodev_builtin_create_cipher_session(
> > -                           builtin, sym_sess_info, errp);
> > +        ret = cryptodev_builtin_create_cipher_session(
> > +                    builtin, sym_sess_info, &local_error);
> > +        break;
> >  
> >      case VIRTIO_CRYPTO_AKCIPHER_CREATE_SESSION:
> >          asym_sess_info = &sess_info->u.asym_sess_info;
> > -        return cryptodev_builtin_create_akcipher_session(
> > -                           builtin, asym_sess_info, errp);
> > +        ret = cryptodev_builtin_create_akcipher_session(
> > +                           builtin, asym_sess_info, &local_error);
> > +        break;
> >  
> >      case VIRTIO_CRYPTO_HASH_CREATE_SESSION:
> >      case VIRTIO_CRYPTO_MAC_CREATE_SESSION:
> >      default:
> > -        error_setg(errp, "Unsupported opcode :%" PRIu32 "",
> > +        error_setg(&local_error, "Unsupported opcode :%" PRIu32 "",
> >                     sess_info->op_code);
> > -        return -1;
> > +        return -VIRTIO_CRYPTO_NOTSUPP;
> >      }
> >  
> > -    return -1;
> > +    if (local_error) {
> > +        error_report_err(local_error);
> > +    }
> > +    if (ret < 0) {
> > +        status = -VIRTIO_CRYPTO_ERR;
> > +    } else {
> > +        sess_info->session_id = ret;
> > +        status = VIRTIO_CRYPTO_OK;
> > +    }
> > +    if (cb) {
> > +        cb(opaque, status);
> > +    }
> > +    return 0;
> >  }
> >  
> >  static int cryptodev_builtin_close_session(
> >             CryptoDevBackend *backend,
> >             uint64_t session_id,
> > -           uint32_t queue_index, Error **errp)
> > +           uint32_t queue_index,
> > +           CryptoDevCompletionFunc cb,
> > +           void *opaque)
> >  {
> >      CryptoDevBackendBuiltin *builtin =
> >                        CRYPTODEV_BACKEND_BUILTIN(backend);
> > @@ -407,6 +427,9 @@ static int cryptodev_builtin_close_session(
> >  
> >      g_free(session);
> >      builtin->sessions[session_id] = NULL;
> > +    if (cb) {
> > +        cb(opaque, VIRTIO_CRYPTO_OK);
> > +    }
> >      return 0;
> >  }
> >  
> > @@ -506,7 +529,9 @@ static int cryptodev_builtin_asym_operation(
> >  static int cryptodev_builtin_operation(
> >                   CryptoDevBackend *backend,
> >                   CryptoDevBackendOpInfo *op_info,
> > -                 uint32_t queue_index, Error **errp)
> > +                 uint32_t queue_index,
> > +                 CryptoDevCompletionFunc cb,
> > +                 void *opaque)
> >  {
> >      CryptoDevBackendBuiltin *builtin =
> >                        CRYPTODEV_BACKEND_BUILTIN(backend);
> > @@ -514,11 +539,12 @@ static int cryptodev_builtin_operation(
> >      CryptoDevBackendSymOpInfo *sym_op_info;
> >      CryptoDevBackendAsymOpInfo *asym_op_info;
> >      enum CryptoDevBackendAlgType algtype = op_info->algtype;
> > -    int ret = -VIRTIO_CRYPTO_ERR;
> > +    int status = -VIRTIO_CRYPTO_ERR;
> > +    Error *local_error = NULL;
> >  
> >      if (op_info->session_id >= MAX_NUM_SESSIONS ||
> >                builtin->sessions[op_info->session_id] == NULL) {
> > -        error_setg(errp, "Cannot find a valid session id: %" PRIu64 "",
> > +        error_setg(&local_error, "Cannot find a valid session id: %" PRIu64 "",
> >                     op_info->session_id);
> >          return -VIRTIO_CRYPTO_INVSESS;
> >      }
> > @@ -526,14 +552,21 @@ static int cryptodev_builtin_operation(
> >      sess = builtin->sessions[op_info->session_id];
> >      if (algtype == CRYPTODEV_BACKEND_ALG_SYM) {
> >          sym_op_info = op_info->u.sym_op_info;
> > -        ret = cryptodev_builtin_sym_operation(sess, sym_op_info, errp);
> > +        status = cryptodev_builtin_sym_operation(sess, sym_op_info,
> > +                                                 &local_error);
> >      } else if (algtype == CRYPTODEV_BACKEND_ALG_ASYM) {
> >          asym_op_info = op_info->u.asym_op_info;
> > -        ret = cryptodev_builtin_asym_operation(sess, op_info->op_code,
> > -                                               asym_op_info, errp);
> > +        status = cryptodev_builtin_asym_operation(sess, op_info->op_code,
> > +                                                  asym_op_info, &local_error);
> >      }
> >  
> > -    return ret;
> > +    if (local_error) {
> > +        error_report_err(local_error);
> > +    }
> > +    if (cb) {
> > +        cb(opaque, status);
> > +    }
> > +    return 0;
> >  }
> >  
> >  static void cryptodev_builtin_cleanup(
> > @@ -548,7 +581,7 @@ static void cryptodev_builtin_cleanup(
> >  
> >      for (i = 0; i < MAX_NUM_SESSIONS; i++) {
> >          if (builtin->sessions[i] != NULL) {
> > -            cryptodev_builtin_close_session(backend, i, 0, &error_abort);
> > +            cryptodev_builtin_close_session(backend, i, 0, NULL, NULL);
> >          }
> >      }
> >  
> > diff --git a/backends/cryptodev-vhost-user.c b/backends/cryptodev-vhost-user.c
> > index 5443a59153..351b2729e0 100644
> > --- a/backends/cryptodev-vhost-user.c
> > +++ b/backends/cryptodev-vhost-user.c
> > @@ -259,13 +259,18 @@ static int64_t cryptodev_vhost_user_sym_create_session(
> >      return -1;
> >  }
> >  
> > -static int64_t cryptodev_vhost_user_create_session(
> > +static int cryptodev_vhost_user_create_session(
> >             CryptoDevBackend *backend,
> >             CryptoDevBackendSessionInfo *sess_info,
> > -           uint32_t queue_index, Error **errp)
> > +           uint32_t queue_index,
> > +           CryptoDevCompletionFunc cb,
> > +           void *opaque)
> >  {
> >      uint32_t op_code = sess_info->op_code;
> >      CryptoDevBackendSymSessionInfo *sym_sess_info;
> > +    int64_t ret;
> > +    Error *local_error = NULL;
> > +    int status;
> >  
> >      switch (op_code) {
> >      case VIRTIO_CRYPTO_CIPHER_CREATE_SESSION:
> > @@ -273,27 +278,42 @@ static int64_t cryptodev_vhost_user_create_session(
> >      case VIRTIO_CRYPTO_MAC_CREATE_SESSION:
> >      case VIRTIO_CRYPTO_AEAD_CREATE_SESSION:
> >          sym_sess_info = &sess_info->u.sym_sess_info;
> > -        return cryptodev_vhost_user_sym_create_session(backend, sym_sess_info,
> > -                   queue_index, errp);
> > +        ret = cryptodev_vhost_user_sym_create_session(backend, sym_sess_info,
> > +                   queue_index, &local_error);
> > +        break;
> > +
> >      default:
> > -        error_setg(errp, "Unsupported opcode :%" PRIu32 "",
> > +        error_setg(&local_error, "Unsupported opcode :%" PRIu32 "",
> >                     sess_info->op_code);
> > -        return -1;
> > -
> > +        return -VIRTIO_CRYPTO_NOTSUPP;
> >      }
> >  
> > -    return -1;
> > +    if (local_error) {
> > +        error_report_err(local_error);
> > +    }
> > +    if (ret < 0) {
> > +        status = -VIRTIO_CRYPTO_ERR;
> > +    } else {
> > +        sess_info->session_id = ret;
> > +        status = VIRTIO_CRYPTO_OK;
> > +    }
> > +    if (cb) {
> > +        cb(opaque, status);
> > +    }
> > +    return 0;
> >  }
> >  
> >  static int cryptodev_vhost_user_close_session(
> >             CryptoDevBackend *backend,
> >             uint64_t session_id,
> > -           uint32_t queue_index, Error **errp)
> > +           uint32_t queue_index,
> > +           CryptoDevCompletionFunc cb,
> > +           void *opaque)
> >  {
> >      CryptoDevBackendClient *cc =
> >                    backend->conf.peers.ccs[queue_index];
> >      CryptoDevBackendVhost *vhost_crypto;
> > -    int ret;
> > +    int ret = -1, status;
> >  
> >      vhost_crypto = cryptodev_vhost_user_get_vhost(cc, backend, queue_index);
> >      if (vhost_crypto) {
> > @@ -301,12 +321,17 @@ static int cryptodev_vhost_user_close_session(
> >          ret = dev->vhost_ops->vhost_crypto_close_session(dev,
> >                                                           session_id);
> >          if (ret < 0) {
> > -            return -1;
> > +            status = -VIRTIO_CRYPTO_ERR;
> >          } else {
> > -            return 0;
> > +            status = VIRTIO_CRYPTO_OK;
> >          }
> > +    } else {
> > +        status = -VIRTIO_CRYPTO_NOTSUPP;
> >      }
> > -    return -1;
> > +    if (cb) {
> > +        cb(opaque, status);
> > +    }
> > +    return 0;
> >  }
> >  
> >  static void cryptodev_vhost_user_cleanup(
> > diff --git a/backends/cryptodev.c b/backends/cryptodev.c
> > index 33eb4e1a70..54ee8c81f5 100644
> > --- a/backends/cryptodev.c
> > +++ b/backends/cryptodev.c
> > @@ -26,6 +26,7 @@
> >  #include "qapi/error.h"
> >  #include "qapi/visitor.h"
> >  #include "qemu/config-file.h"
> > +#include "qemu/error-report.h"
> >  #include "qom/object_interfaces.h"
> >  #include "hw/virtio/virtio-crypto.h"
> >  
> > @@ -72,69 +73,72 @@ void cryptodev_backend_cleanup(
> >      }
> >  }
> >  
> > -int64_t cryptodev_backend_create_session(
> > +int cryptodev_backend_create_session(
> >             CryptoDevBackend *backend,
> >             CryptoDevBackendSessionInfo *sess_info,
> > -           uint32_t queue_index, Error **errp)
> > +           uint32_t queue_index,
> > +           CryptoDevCompletionFunc cb,
> > +           void *opaque)
> >  {
> >      CryptoDevBackendClass *bc =
> >                        CRYPTODEV_BACKEND_GET_CLASS(backend);
> >  
> >      if (bc->create_session) {
> > -        return bc->create_session(backend, sess_info, queue_index, errp);
> > +        return bc->create_session(backend, sess_info, queue_index, cb, opaque);
> >      }
> > -
> > -    return -1;
> > +    return -VIRTIO_CRYPTO_NOTSUPP;
> >  }
> >  
> >  int cryptodev_backend_close_session(
> >             CryptoDevBackend *backend,
> >             uint64_t session_id,
> > -           uint32_t queue_index, Error **errp)
> > +           uint32_t queue_index,
> > +           CryptoDevCompletionFunc cb,
> > +           void *opaque)
> >  {
> >      CryptoDevBackendClass *bc =
> >                        CRYPTODEV_BACKEND_GET_CLASS(backend);
> >  
> >      if (bc->close_session) {
> > -        return bc->close_session(backend, session_id, queue_index, errp);
> > +        return bc->close_session(backend, session_id, queue_index, cb, opaque);
> >      }
> > -
> > -    return -1;
> > +    return -VIRTIO_CRYPTO_NOTSUPP;
> >  }
> >  
> >  static int cryptodev_backend_operation(
> >                   CryptoDevBackend *backend,
> >                   CryptoDevBackendOpInfo *op_info,
> > -                 uint32_t queue_index, Error **errp)
> > +                 uint32_t queue_index,
> > +                 CryptoDevCompletionFunc cb,
> > +                 void *opaque)
> >  {
> >      CryptoDevBackendClass *bc =
> >                        CRYPTODEV_BACKEND_GET_CLASS(backend);
> >  
> >      if (bc->do_op) {
> > -        return bc->do_op(backend, op_info, queue_index, errp);
> > +        return bc->do_op(backend, op_info, queue_index, cb, opaque);
> >      }
> > -
> > -    return -VIRTIO_CRYPTO_ERR;
> > +    return -VIRTIO_CRYPTO_NOTSUPP;
> >  }
> >  
> >  int cryptodev_backend_crypto_operation(
> >                   CryptoDevBackend *backend,
> > -                 void *opaque,
> > -                 uint32_t queue_index, Error **errp)
> > +                 void *opaque1,
> > +                 uint32_t queue_index,
> > +                 CryptoDevCompletionFunc cb, void *opaque2)
> >  {
> > -    VirtIOCryptoReq *req = opaque;
> > +    VirtIOCryptoReq *req = opaque1;
> >      CryptoDevBackendOpInfo *op_info = &req->op_info;
> >      enum CryptoDevBackendAlgType algtype = req->flags;
> >  
> >      if ((algtype != CRYPTODEV_BACKEND_ALG_SYM)
> >          && (algtype != CRYPTODEV_BACKEND_ALG_ASYM)) {
> > -        error_setg(errp, "Unsupported cryptodev alg type: %" PRIu32 "",
> > -                   algtype);
> > -
> > +        error_report("Unsupported cryptodev alg type: %" PRIu32 "", algtype);
> >          return -VIRTIO_CRYPTO_NOTSUPP;
> >      }
> >  
> > -    return cryptodev_backend_operation(backend, op_info, queue_index, errp);
> > +    return cryptodev_backend_operation(backend, op_info, queue_index,
> > +                                       cb, opaque2);
> >  }
> >  
> >  static void
> > diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
> > index df4bde210b..39c8f5914e 100644
> > --- a/hw/virtio/virtio-crypto.c
> > +++ b/hw/virtio/virtio-crypto.c
> > @@ -27,6 +27,39 @@
> >  
> >  #define VIRTIO_CRYPTO_VM_VERSION 1
> >  
> > +typedef struct VirtIOCryptoSessionReq {
> > +    VirtIODevice *vdev;
> > +    VirtQueue *vq;
> > +    VirtQueueElement *elem;
> > +    CryptoDevBackendSessionInfo info;
> > +    CryptoDevCompletionFunc cb;
> > +} VirtIOCryptoSessionReq;
> > +
> > +static void virtio_crypto_free_create_session_req(VirtIOCryptoSessionReq *sreq)
> > +{
> > +    switch (sreq->info.op_code) {
> > +    case VIRTIO_CRYPTO_CIPHER_CREATE_SESSION:
> > +        g_free(sreq->info.u.sym_sess_info.cipher_key);
> > +        g_free(sreq->info.u.sym_sess_info.auth_key);
> > +        break;
> > +
> > +    case VIRTIO_CRYPTO_AKCIPHER_CREATE_SESSION:
> > +        g_free(sreq->info.u.asym_sess_info.key);
> > +        break;
> > +
> > +    case VIRTIO_CRYPTO_CIPHER_DESTROY_SESSION:
> > +    case VIRTIO_CRYPTO_HASH_DESTROY_SESSION:
> > +    case VIRTIO_CRYPTO_MAC_DESTROY_SESSION:
> > +    case VIRTIO_CRYPTO_AEAD_DESTROY_SESSION:
> > +    case VIRTIO_CRYPTO_AKCIPHER_DESTROY_SESSION:
> > +        break;
> > +
> > +    default:
> > +        error_report("Unknown opcode: %u", sreq->info.op_code);
> > +    }
> > +    g_free(sreq);
> > +}
> > +
> >  /*
> >   * Transfer virtqueue index to crypto queue index.
> >   * The control virtqueue is after the data virtqueues
> > @@ -75,27 +108,24 @@ virtio_crypto_cipher_session_helper(VirtIODevice *vdev,
> >      return 0;
> >  }
> >  
> > -static int64_t
> > +static int
> >  virtio_crypto_create_sym_session(VirtIOCrypto *vcrypto,
> >                 struct virtio_crypto_sym_create_session_req *sess_req,
> >                 uint32_t queue_id,
> >                 uint32_t opcode,
> > -               struct iovec *iov, unsigned int out_num)
> > +               struct iovec *iov, unsigned int out_num,
> > +               VirtIOCryptoSessionReq *sreq)
> >  {
> >      VirtIODevice *vdev = VIRTIO_DEVICE(vcrypto);
> > -    CryptoDevBackendSessionInfo info;
> > -    CryptoDevBackendSymSessionInfo *sym_info;
> > -    int64_t session_id;
> > +    CryptoDevBackendSymSessionInfo *sym_info = &sreq->info.u.sym_sess_info;
> >      int queue_index;
> >      uint32_t op_type;
> > -    Error *local_err = NULL;
> >      int ret;
> >  
> > -    memset(&info, 0, sizeof(info));
> >      op_type = ldl_le_p(&sess_req->op_type);
> > -    info.op_code = opcode;
> > +    sreq->info.op_code = opcode;
> >  
> > -    sym_info = &info.u.sym_sess_info;
> > +    sym_info = &sreq->info.u.sym_sess_info;
> >      sym_info->op_type = op_type;
> >  
> >      if (op_type == VIRTIO_CRYPTO_SYM_OP_CIPHER) {
> > @@ -103,7 +133,7 @@ virtio_crypto_create_sym_session(VirtIOCrypto *vcrypto,
> >                             &sess_req->u.cipher.para,
> >                             &iov, &out_num);
> >          if (ret < 0) {
> > -            goto err;
> > +            return ret;
> >          }
> >      } else if (op_type == VIRTIO_CRYPTO_SYM_OP_ALGORITHM_CHAINING) {
> >          size_t s;
> > @@ -112,7 +142,7 @@ virtio_crypto_create_sym_session(VirtIOCrypto *vcrypto,
> >                             &sess_req->u.chain.para.cipher_param,
> >                             &iov, &out_num);
> >          if (ret < 0) {
> > -            goto err;
> > +            return ret;
> >          }
> >          /* hash part */
> >          sym_info->alg_chain_order = ldl_le_p(
> > @@ -129,8 +159,7 @@ virtio_crypto_create_sym_session(VirtIOCrypto *vcrypto,
> >              if (sym_info->auth_key_len > vcrypto->conf.max_auth_key_len) {
> >                  error_report("virtio-crypto length of auth key is too big: %u",
> >                               sym_info->auth_key_len);
> > -                ret = -VIRTIO_CRYPTO_ERR;
> > -                goto err;
> > +                return -VIRTIO_CRYPTO_ERR;
> >              }
> >              /* get auth key */
> >              if (sym_info->auth_key_len > 0) {
> > @@ -140,8 +169,7 @@ virtio_crypto_create_sym_session(VirtIOCrypto *vcrypto,
> >                  if (unlikely(s != sym_info->auth_key_len)) {
> >                      virtio_error(vdev,
> >                            "virtio-crypto authenticated key incorrect");
> > -                    ret = -EFAULT;
> > -                    goto err;
> > +                    return -EFAULT;
> >                  }
> >                  iov_discard_front(&iov, &out_num, sym_info->auth_key_len);
> >              }
> > @@ -153,49 +181,30 @@ virtio_crypto_create_sym_session(VirtIOCrypto *vcrypto,
> >          } else {
> >              /* VIRTIO_CRYPTO_SYM_HASH_MODE_NESTED */
> >              error_report("unsupported hash mode");
> > -            ret = -VIRTIO_CRYPTO_NOTSUPP;
> > -            goto err;
> > +            return -VIRTIO_CRYPTO_NOTSUPP;
> >          }
> >      } else {
> >          /* VIRTIO_CRYPTO_SYM_OP_NONE */
> >          error_report("unsupported cipher op_type: VIRTIO_CRYPTO_SYM_OP_NONE");
> > -        ret = -VIRTIO_CRYPTO_NOTSUPP;
> > -        goto err;
> > +        return -VIRTIO_CRYPTO_NOTSUPP;
> >      }
> >  
> >      queue_index = virtio_crypto_vq2q(queue_id);
> > -    session_id = cryptodev_backend_create_session(
> > -                                     vcrypto->cryptodev,
> > -                                     &info, queue_index, &local_err);
> > -    if (session_id >= 0) {
> > -        ret = session_id;
> > -    } else {
> > -        if (local_err) {
> > -            error_report_err(local_err);
> > -        }
> > -        ret = -VIRTIO_CRYPTO_ERR;
> > -    }
> > -
> > -err:
> > -    g_free(sym_info->cipher_key);
> > -    g_free(sym_info->auth_key);
> > -    return ret;
> > +    return cryptodev_backend_create_session(vcrypto->cryptodev, &sreq->info,
> > +                                            queue_index, sreq->cb, sreq);
> >  }
> >  
> > -static int64_t
> > +static int
> >  virtio_crypto_create_asym_session(VirtIOCrypto *vcrypto,
> >                 struct virtio_crypto_akcipher_create_session_req *sess_req,
> >                 uint32_t queue_id, uint32_t opcode,
> > -               struct iovec *iov, unsigned int out_num)
> > +               struct iovec *iov, unsigned int out_num,
> > +               VirtIOCryptoSessionReq *sreq)
> >  {
> >      VirtIODevice *vdev = VIRTIO_DEVICE(vcrypto);
> > -    CryptoDevBackendSessionInfo info = {0};
> > -    CryptoDevBackendAsymSessionInfo *asym_info;
> > -    int64_t session_id;
> > +    CryptoDevBackendAsymSessionInfo *asym_info = &sreq->info.u.asym_sess_info;
> >      int queue_index;
> >      uint32_t algo, keytype, keylen;
> > -    g_autofree uint8_t *key = NULL;
> > -    Error *local_err = NULL;
> >  
> >      algo = ldl_le_p(&sess_req->para.algo);
> >      keytype = ldl_le_p(&sess_req->para.keytype);
> > @@ -208,20 +217,19 @@ virtio_crypto_create_asym_session(VirtIOCrypto *vcrypto,
> >      }
> >  
> >      if (keylen) {
> > -        key = g_malloc(keylen);
> > -        if (iov_to_buf(iov, out_num, 0, key, keylen) != keylen) {
> > +        asym_info->key = g_malloc(keylen);
> > +        if (iov_to_buf(iov, out_num, 0, asym_info->key, keylen) != keylen) {
> >              virtio_error(vdev, "virtio-crypto asym key incorrect");
> >              return -EFAULT;
> >          }
> >          iov_discard_front(&iov, &out_num, keylen);
> >      }
> >  
> > -    info.op_code = opcode;
> > -    asym_info = &info.u.asym_sess_info;
> > +    sreq->info.op_code = opcode;
> > +    asym_info = &sreq->info.u.asym_sess_info;
> >      asym_info->algo = algo;
> >      asym_info->keytype = keytype;
> >      asym_info->keylen = keylen;
> > -    asym_info->key = key;
> >      switch (asym_info->algo) {
> >      case VIRTIO_CRYPTO_AKCIPHER_RSA:
> >          asym_info->u.rsa.padding_algo =
> > @@ -237,45 +245,95 @@ virtio_crypto_create_asym_session(VirtIOCrypto *vcrypto,
> >      }
> >  
> >      queue_index = virtio_crypto_vq2q(queue_id);
> > -    session_id = cryptodev_backend_create_session(vcrypto->cryptodev, &info,
> > -                     queue_index, &local_err);
> > -    if (session_id < 0) {
> > -        if (local_err) {
> > -            error_report_err(local_err);
> > -        }
> > -        return -VIRTIO_CRYPTO_ERR;
> > -    }
> > -
> > -    return session_id;
> > +    return cryptodev_backend_create_session(vcrypto->cryptodev, &sreq->info,
> > +                                            queue_index, sreq->cb, sreq);
> >  }
> >  
> > -static uint8_t
> > +static int
> >  virtio_crypto_handle_close_session(VirtIOCrypto *vcrypto,
> >           struct virtio_crypto_destroy_session_req *close_sess_req,
> > -         uint32_t queue_id)
> > +         uint32_t queue_id,
> > +         VirtIOCryptoSessionReq *sreq)
> >  {
> > -    int ret;
> >      uint64_t session_id;
> > -    uint32_t status;
> > -    Error *local_err = NULL;
> >  
> >      session_id = ldq_le_p(&close_sess_req->session_id);
> >      DPRINTF("close session, id=%" PRIu64 "\n", session_id);
> >  
> > -    ret = cryptodev_backend_close_session(
> > -              vcrypto->cryptodev, session_id, queue_id, &local_err);
> > -    if (ret == 0) {
> > -        status = VIRTIO_CRYPTO_OK;
> > +    return cryptodev_backend_close_session(
> > +                vcrypto->cryptodev, session_id, queue_id, sreq->cb, sreq);
> > +}
> > +
> > +static void virtio_crypto_create_session_completion(void *opaque, int ret)
> > +{
> > +    VirtIOCryptoSessionReq *sreq = (VirtIOCryptoSessionReq *)opaque;
> > +    VirtQueue *vq = sreq->vq;
> > +    VirtQueueElement *elem = sreq->elem;
> > +    VirtIODevice *vdev = sreq->vdev;
> > +    struct virtio_crypto_session_input input;
> > +    struct iovec *in_iov = elem->in_sg;
> > +    unsigned in_num = elem->in_num;
> > +    size_t s;
> > +
> > +    memset(&input, 0, sizeof(input));
> > +    /* Serious errors, need to reset virtio crypto device */
> > +    if (ret == -EFAULT) {
> > +        virtqueue_detach_element(vq, elem, 0);
> > +        goto out;
> > +    } else if (ret == -VIRTIO_CRYPTO_NOTSUPP) {
> > +        stl_le_p(&input.status, VIRTIO_CRYPTO_NOTSUPP);
> > +    } else if (ret == -VIRTIO_CRYPTO_KEY_REJECTED) {
> > +        stl_le_p(&input.status, VIRTIO_CRYPTO_KEY_REJECTED);
> > +    } else if (ret != VIRTIO_CRYPTO_OK) {
> > +        stl_le_p(&input.status, VIRTIO_CRYPTO_ERR);
> >      } else {
> > -        if (local_err) {
> > -            error_report_err(local_err);
> > -        } else {
> > -            error_report("destroy session failed");
> > -        }
> > +        /* Set the session id */
> > +        stq_le_p(&input.session_id, sreq->info.session_id);
> > +        stl_le_p(&input.status, VIRTIO_CRYPTO_OK);
> > +    }
> > +
> > +    s = iov_from_buf(in_iov, in_num, 0, &input, sizeof(input));
> > +    if (unlikely(s != sizeof(input))) {
> > +        virtio_error(vdev, "virtio-crypto input incorrect");
> > +        virtqueue_detach_element(vq, elem, 0);
> > +        goto out;
> > +    }
> > +    virtqueue_push(vq, elem, sizeof(input));
> > +    virtio_notify(vdev, vq);
> > +
> > +out:
> > +    g_free(elem);
> > +    virtio_crypto_free_create_session_req(sreq);
> > +}
> > +
> > +static void virtio_crypto_destroy_session_completion(void *opaque, int ret)
> > +{
> > +    VirtIOCryptoSessionReq *sreq = (VirtIOCryptoSessionReq *)opaque;
> > +    VirtQueue *vq = sreq->vq;
> > +    VirtQueueElement *elem = sreq->elem;
> > +    VirtIODevice *vdev = sreq->vdev;
> > +    struct iovec *in_iov = elem->in_sg;
> > +    unsigned in_num = elem->in_num;
> > +    uint8_t status;
> > +    size_t s;
> > +
> > +    if (ret < 0) {
> >          status = VIRTIO_CRYPTO_ERR;
> > +    } else {
> > +        status = VIRTIO_CRYPTO_OK;
> > +    }
> > +    s = iov_from_buf(in_iov, in_num, 0, &status, sizeof(status));
> > +    if (unlikely(s != sizeof(status))) {
> > +        virtio_error(vdev, "virtio-crypto status incorrect");
> > +        virtqueue_detach_element(vq, elem, 0);
> > +        goto out;
> >      }
> > +    virtqueue_push(vq, elem, sizeof(status));
> > +    virtio_notify(vdev, vq);
> >  
> > -    return status;
> > +out:
> > +    g_free(elem);
> > +    g_free(sreq);
> >  }
> >  
> >  static void virtio_crypto_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
> > @@ -283,16 +341,16 @@ static void virtio_crypto_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
> >      VirtIOCrypto *vcrypto = VIRTIO_CRYPTO(vdev);
> >      struct virtio_crypto_op_ctrl_req ctrl;
> >      VirtQueueElement *elem;
> > -    struct iovec *in_iov;
> > -    struct iovec *out_iov;
> > -    unsigned in_num;
> > +    VirtIOCryptoSessionReq *sreq;
> >      unsigned out_num;
> > +    unsigned in_num;
> >      uint32_t queue_id;
> >      uint32_t opcode;
> >      struct virtio_crypto_session_input input;
> > -    int64_t session_id;
> > -    uint8_t status;
> >      size_t s;
> > +    int ret;
> > +    struct iovec *out_iov;
> > +    struct iovec *in_iov;
> >  
> >      for (;;) {
> >          g_autofree struct iovec *out_iov_copy = NULL;
> > @@ -327,44 +385,34 @@ static void virtio_crypto_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
> >          opcode = ldl_le_p(&ctrl.header.opcode);
> >          queue_id = ldl_le_p(&ctrl.header.queue_id);
> >  
> > -        memset(&input, 0, sizeof(input));
> > +        sreq = g_new0(VirtIOCryptoSessionReq, 1);
> > +        sreq->vdev = vdev;
> > +        sreq->vq = vq;
> > +        sreq->elem = elem;
> > +
> >          switch (opcode) {
> >          case VIRTIO_CRYPTO_CIPHER_CREATE_SESSION:
> > -            session_id = virtio_crypto_create_sym_session(vcrypto,
> > -                             &ctrl.u.sym_create_session,
> > -                             queue_id, opcode,
> > -                             out_iov, out_num);
> > -            goto check_session;
> > +            sreq->cb = virtio_crypto_create_session_completion;
> > +            ret = virtio_crypto_create_sym_session(vcrypto,
> > +                            &ctrl.u.sym_create_session,
> > +                            queue_id, opcode,
> > +                            out_iov, out_num,
> > +                            sreq);
> > +            if (ret < 0) {
> > +                virtio_crypto_create_session_completion(sreq, ret);
> > +            }
> > +            break;
> >  
> >          case VIRTIO_CRYPTO_AKCIPHER_CREATE_SESSION:
> > -            session_id = virtio_crypto_create_asym_session(vcrypto,
> > +            sreq->cb = virtio_crypto_create_session_completion;
> > +            ret = virtio_crypto_create_asym_session(vcrypto,
> >                               &ctrl.u.akcipher_create_session,
> >                               queue_id, opcode,
> > -                             out_iov, out_num);
> > -
> > -check_session:
> > -            /* Serious errors, need to reset virtio crypto device */
> > -            if (session_id == -EFAULT) {
> > -                virtqueue_detach_element(vq, elem, 0);
> > -                break;
> > -            } else if (session_id == -VIRTIO_CRYPTO_NOTSUPP) {
> > -                stl_le_p(&input.status, VIRTIO_CRYPTO_NOTSUPP);
> > -            } else if (session_id == -VIRTIO_CRYPTO_ERR) {
> > -                stl_le_p(&input.status, VIRTIO_CRYPTO_ERR);
> > -            } else {
> > -                /* Set the session id */
> > -                stq_le_p(&input.session_id, session_id);
> > -                stl_le_p(&input.status, VIRTIO_CRYPTO_OK);
> > -            }
> > -
> > -            s = iov_from_buf(in_iov, in_num, 0, &input, sizeof(input));
> > -            if (unlikely(s != sizeof(input))) {
> > -                virtio_error(vdev, "virtio-crypto input incorrect");
> > -                virtqueue_detach_element(vq, elem, 0);
> > -                break;
> > +                             out_iov, out_num,
> > +                             sreq);
> > +            if (ret < 0) {
> > +                virtio_crypto_create_session_completion(sreq, ret);
> >              }
> > -            virtqueue_push(vq, elem, sizeof(input));
> > -            virtio_notify(vdev, vq);
> >              break;
> >  
> >          case VIRTIO_CRYPTO_CIPHER_DESTROY_SESSION:
> > @@ -372,37 +420,36 @@ check_session:
> >          case VIRTIO_CRYPTO_MAC_DESTROY_SESSION:
> >          case VIRTIO_CRYPTO_AEAD_DESTROY_SESSION:
> >          case VIRTIO_CRYPTO_AKCIPHER_DESTROY_SESSION:
> > -            status = virtio_crypto_handle_close_session(vcrypto,
> > -                   &ctrl.u.destroy_session, queue_id);
> > -            /* The status only occupy one byte, we can directly use it */
> > -            s = iov_from_buf(in_iov, in_num, 0, &status, sizeof(status));
> > -            if (unlikely(s != sizeof(status))) {
> > -                virtio_error(vdev, "virtio-crypto status incorrect");
> > -                virtqueue_detach_element(vq, elem, 0);
> > -                break;
> > +            sreq->cb = virtio_crypto_destroy_session_completion;
> > +            ret = virtio_crypto_handle_close_session(vcrypto,
> > +                   &ctrl.u.destroy_session, queue_id,
> > +                   sreq);
> > +            if (ret < 0) {
> > +                virtio_crypto_destroy_session_completion(sreq, ret);
> >              }
> > -            virtqueue_push(vq, elem, sizeof(status));
> > -            virtio_notify(vdev, vq);
> >              break;
> > +
> >          case VIRTIO_CRYPTO_HASH_CREATE_SESSION:
> >          case VIRTIO_CRYPTO_MAC_CREATE_SESSION:
> >          case VIRTIO_CRYPTO_AEAD_CREATE_SESSION:
> >          default:
> > +            memset(&input, 0, sizeof(input));
> >              error_report("virtio-crypto unsupported ctrl opcode: %d", opcode);
> >              stl_le_p(&input.status, VIRTIO_CRYPTO_NOTSUPP);
> >              s = iov_from_buf(in_iov, in_num, 0, &input, sizeof(input));
> >              if (unlikely(s != sizeof(input))) {
> >                  virtio_error(vdev, "virtio-crypto input incorrect");
> >                  virtqueue_detach_element(vq, elem, 0);
> > -                break;
> > +            } else {
> > +                virtqueue_push(vq, elem, sizeof(input));
> > +                virtio_notify(vdev, vq);
> >              }
> > -            virtqueue_push(vq, elem, sizeof(input));
> > -            virtio_notify(vdev, vq);
> > +            g_free(sreq);
> > +            g_free(elem);
> >  
> >              break;
> >          } /* end switch case */
> >  
> > -        g_free(elem);
> >      } /* end for loop */
> >  }
> >  
> > @@ -513,11 +560,13 @@ virtio_crypto_akcipher_input_data_helper(VirtIODevice *vdev,
> >      req->in_len = sizeof(struct virtio_crypto_inhdr) + asym_op_info->dst_len;
> >  }
> >  
> > -
> > -static void virtio_crypto_req_complete(VirtIOCryptoReq *req, uint8_t status)
> > +static void virtio_crypto_req_complete(void *opaque, int ret)
> >  {
> > +    VirtIOCryptoReq *req = (VirtIOCryptoReq *)opaque;
> >      VirtIOCrypto *vcrypto = req->vcrypto;
> >      VirtIODevice *vdev = VIRTIO_DEVICE(vcrypto);
> > +    uint8_t status = -ret;
> > +    g_autofree struct iovec *in_iov_copy = req->in_iov;
> >  
> >      if (req->flags == CRYPTODEV_BACKEND_ALG_SYM) {
> >          virtio_crypto_sym_input_data_helper(vdev, req, status,
> 
> I am not sure why is this g_autofree here.
> The variable is unused and clang gets confused (a bug in
> clang but oh well).
> Is the point to free when this goes out of scope?
> I suspect we should just g_free inside virtio_crypto_free_request
> or something like this.
> Pls send a fixup as otherwise I'll have to defer this until after
> the coming release.


Also to me it looks like not all paths call virtio_crypto_req_complete
so there might be a memory leak here.

Generally using g_autofree for something not allocated in the same
function is a hack.
I think I'll drop this patchset unless we can fix this quickly.


> 
> 
> > @@ -529,6 +578,7 @@ static void virtio_crypto_req_complete(VirtIOCryptoReq *req, uint8_t status)
> >      stb_p(&req->in->status, status);
> >      virtqueue_push(req->vq, &req->elem, req->in_len);
> >      virtio_notify(vdev, req->vq);
> > +    virtio_crypto_free_request(req);
> >  }
> >  
> >  static VirtIOCryptoReq *
> > @@ -773,9 +823,7 @@ virtio_crypto_handle_request(VirtIOCryptoReq *request)
> >      unsigned in_num;
> >      unsigned out_num;
> >      uint32_t opcode;
> > -    uint8_t status = VIRTIO_CRYPTO_ERR;
> >      CryptoDevBackendOpInfo *op_info = &request->op_info;
> > -    Error *local_err = NULL;
> >  
> >      if (elem->out_num < 1 || elem->in_num < 1) {
> >          virtio_error(vdev, "virtio-crypto dataq missing headers");
> > @@ -815,6 +863,8 @@ virtio_crypto_handle_request(VirtIOCryptoReq *request)
> >       */
> >      request->in_num = in_num;
> >      request->in_iov = in_iov;
> > +    /* now, we free the in_iov_copy inside virtio_crypto_req_complete */
> > +    in_iov_copy = NULL;
> >  
> >      opcode = ldl_le_p(&req.header.opcode);
> >      op_info->session_id = ldq_le_p(&req.header.session_id);
> > @@ -844,22 +894,11 @@ check_result:
> >              return -1;
> >          } else if (ret == -VIRTIO_CRYPTO_NOTSUPP) {
> >              virtio_crypto_req_complete(request, VIRTIO_CRYPTO_NOTSUPP);
> > -            virtio_crypto_free_request(request);
> >          } else {
> > -
> > -            /* Set request's parameter */
> > -            ret = cryptodev_backend_crypto_operation(vcrypto->cryptodev,
> > -                                    request, queue_index, &local_err);
> > -            if (ret < 0) {
> > -                status = -ret;
> > -                if (local_err) {
> > -                    error_report_err(local_err);
> > -                }
> > -            } else { /* ret == VIRTIO_CRYPTO_OK */
> > -                status = ret;
> > -            }
> > -            virtio_crypto_req_complete(request, status);
> > -            virtio_crypto_free_request(request);
> > +            cryptodev_backend_crypto_operation(vcrypto->cryptodev,
> > +                                    request, queue_index,
> > +                                    virtio_crypto_req_complete,
> > +                                    request);
> >          }
> >          break;
> >  
> > @@ -871,7 +910,6 @@ check_result:
> >          error_report("virtio-crypto unsupported dataq opcode: %u",
> >                       opcode);
> >          virtio_crypto_req_complete(request, VIRTIO_CRYPTO_NOTSUPP);
> > -        virtio_crypto_free_request(request);
> >      }
> >  
> >      return 0;
> > @@ -1011,7 +1049,7 @@ static void virtio_crypto_device_realize(DeviceState *dev, Error **errp)
> >          vcrypto->vqs[i].vcrypto = vcrypto;
> >      }
> >  
> > -    vcrypto->ctrl_vq = virtio_add_queue(vdev, 64, virtio_crypto_handle_ctrl);
> > +    vcrypto->ctrl_vq = virtio_add_queue(vdev, 1024, virtio_crypto_handle_ctrl);
> >      if (!cryptodev_backend_is_ready(vcrypto->cryptodev)) {
> >          vcrypto->status &= ~VIRTIO_CRYPTO_S_HW_READY;
> >      } else {
> > diff --git a/include/sysemu/cryptodev.h b/include/sysemu/cryptodev.h
> > index 37c3a360fd..32e9f4cf8a 100644
> > --- a/include/sysemu/cryptodev.h
> > +++ b/include/sysemu/cryptodev.h
> > @@ -113,6 +113,7 @@ typedef struct CryptoDevBackendSessionInfo {
> >          CryptoDevBackendSymSessionInfo sym_sess_info;
> >          CryptoDevBackendAsymSessionInfo asym_sess_info;
> >      } u;
> > +    uint64_t session_id;
> >  } CryptoDevBackendSessionInfo;
> >  
> >  /**
> > @@ -188,21 +189,30 @@ typedef struct CryptoDevBackendOpInfo {
> >      } u;
> >  } CryptoDevBackendOpInfo;
> >  
> > +typedef void (*CryptoDevCompletionFunc) (void *opaque, int ret);
> >  struct CryptoDevBackendClass {
> >      ObjectClass parent_class;
> >  
> >      void (*init)(CryptoDevBackend *backend, Error **errp);
> >      void (*cleanup)(CryptoDevBackend *backend, Error **errp);
> >  
> > -    int64_t (*create_session)(CryptoDevBackend *backend,
> > -                       CryptoDevBackendSessionInfo *sess_info,
> > -                       uint32_t queue_index, Error **errp);
> > +    int (*create_session)(CryptoDevBackend *backend,
> > +                          CryptoDevBackendSessionInfo *sess_info,
> > +                          uint32_t queue_index,
> > +                          CryptoDevCompletionFunc cb,
> > +                          void *opaque);
> > +
> >      int (*close_session)(CryptoDevBackend *backend,
> > -                           uint64_t session_id,
> > -                           uint32_t queue_index, Error **errp);
> > +                         uint64_t session_id,
> > +                         uint32_t queue_index,
> > +                         CryptoDevCompletionFunc cb,
> > +                         void *opaque);
> > +
> >      int (*do_op)(CryptoDevBackend *backend,
> > -                     CryptoDevBackendOpInfo *op_info,
> > -                     uint32_t queue_index, Error **errp);
> > +                 CryptoDevBackendOpInfo *op_info,
> > +                 uint32_t queue_index,
> > +                 CryptoDevCompletionFunc cb,
> > +                 void *opaque);
> >  };
> >  
> >  typedef enum CryptoDevBackendOptionsType {
> > @@ -303,15 +313,20 @@ void cryptodev_backend_cleanup(
> >   * @sess_info: parameters needed by session creating
> >   * @queue_index: queue index of cryptodev backend client
> >   * @errp: pointer to a NULL-initialized error object
> > + * @cb: callback when session create is compeleted
> > + * @opaque: parameter passed to callback
> >   *
> > - * Create a session for symmetric/symmetric algorithms
> > + * Create a session for symmetric/asymmetric algorithms
> >   *
> > - * Returns: session id on success, or -1 on error
> > + * Returns: 0 for success and cb will be called when creation is completed,
> > + * negative value for error, and cb will not be called.
> >   */
> > -int64_t cryptodev_backend_create_session(
> > +int cryptodev_backend_create_session(
> >             CryptoDevBackend *backend,
> >             CryptoDevBackendSessionInfo *sess_info,
> > -           uint32_t queue_index, Error **errp);
> > +           uint32_t queue_index,
> > +           CryptoDevCompletionFunc cb,
> > +           void *opaque);
> >  
> >  /**
> >   * cryptodev_backend_close_session:
> > @@ -319,34 +334,43 @@ int64_t cryptodev_backend_create_session(
> >   * @session_id: the session id
> >   * @queue_index: queue index of cryptodev backend client
> >   * @errp: pointer to a NULL-initialized error object
> > + * @cb: callback when session create is compeleted
> > + * @opaque: parameter passed to callback
> >   *
> >   * Close a session for which was previously
> >   * created by cryptodev_backend_create_session()
> >   *
> > - * Returns: 0 on success, or Negative on error
> > + * Returns: 0 for success and cb will be called when creation is completed,
> > + * negative value for error, and cb will not be called.
> >   */
> >  int cryptodev_backend_close_session(
> >             CryptoDevBackend *backend,
> >             uint64_t session_id,
> > -           uint32_t queue_index, Error **errp);
> > +           uint32_t queue_index,
> > +           CryptoDevCompletionFunc cb,
> > +           void *opaque);
> >  
> >  /**
> >   * cryptodev_backend_crypto_operation:
> >   * @backend: the cryptodev backend object
> > - * @opaque: pointer to a VirtIOCryptoReq object
> > + * @opaque1: pointer to a VirtIOCryptoReq object
> >   * @queue_index: queue index of cryptodev backend client
> >   * @errp: pointer to a NULL-initialized error object
> > + * @cb: callbacks when operation is completed
> > + * @opaque2: parameter passed to cb
> >   *
> >   * Do crypto operation, such as encryption and
> >   * decryption
> >   *
> > - * Returns: VIRTIO_CRYPTO_OK on success,
> > - *         or -VIRTIO_CRYPTO_* on error
> > + * Returns: 0 for success and cb will be called when creation is completed,
> > + * negative value for error, and cb will not be called.
> >   */
> >  int cryptodev_backend_crypto_operation(
> >                   CryptoDevBackend *backend,
> > -                 void *opaque,
> > -                 uint32_t queue_index, Error **errp);
> > +                 void *opaque1,
> > +                 uint32_t queue_index,
> > +                 CryptoDevCompletionFunc cb,
> > +                 void *opaque2);
> >  
> >  /**
> >   * cryptodev_backend_set_used:
> > -- 
> > 2.11.0


