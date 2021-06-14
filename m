Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A517A3A68D4
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 16:18:29 +0200 (CEST)
Received: from localhost ([::1]:52280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsnQ4-0005y2-L1
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 10:18:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lsnNw-0003Ho-Nd
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 10:16:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lsnNu-0007gx-Fd
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 10:16:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623680173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vd9/vY1zGVnlpSVQjHkS4OKwVl4J3E2AVlyBQsTqL0g=;
 b=dY8DMVMcJ2zdXe+DeLhKii7ngHwWs3tb93lIetwFaBgiHEsm2O00Ph7mJfChAImZWO8KkU
 adx3wHZ5ngjwVpK51z5Av+UjWpT/RZjY+U30rEGzFq8oNeKUfKYl79OnCOUY/wAcqNOmFU
 DZNKq7H5JqeCenjDDUbceu7xSF2l1VA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-uIuZ9pSzNPO9IaIlgt2TVA-1; Mon, 14 Jun 2021 10:16:09 -0400
X-MC-Unique: uIuZ9pSzNPO9IaIlgt2TVA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57CBD1084F48;
 Mon, 14 Jun 2021 14:16:08 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-55.ams2.redhat.com
 [10.36.115.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 59C1B19C46;
 Mon, 14 Jun 2021 14:16:01 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/13] docs: document how to pass secret data to QEMU
Date: Mon, 14 Jun 2021 15:15:38 +0100
Message-Id: <20210614141549.100410-3-berrange@redhat.com>
In-Reply-To: <20210614141549.100410-1-berrange@redhat.com>
References: <20210614141549.100410-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 docs/system/index.rst   |   1 +
 docs/system/secrets.rst | 162 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 163 insertions(+)
 create mode 100644 docs/system/secrets.rst

diff --git a/docs/system/index.rst b/docs/system/index.rst
index b05af716a9..6aa2f8c05c 100644
--- a/docs/system/index.rst
+++ b/docs/system/index.rst
@@ -30,6 +30,7 @@ Contents:
    guest-loader
    vnc-security
    tls
+   secrets
    gdb
    managed-startup
    cpu-hotplug
diff --git a/docs/system/secrets.rst b/docs/system/secrets.rst
new file mode 100644
index 0000000000..4a177369b6
--- /dev/null
+++ b/docs/system/secrets.rst
@@ -0,0 +1,162 @@
+.. _secret data:
+
+Providing secret data to QEMU
+-----------------------------
+
+There are a variety of objects in QEMU which require secret data to be provided
+by the administrator or management application. For example, network block
+devices often require a password, LUKS block devices require a passphrase to
+unlock key material, remote desktop services require an access password.
+QEMU has a general purpose mechanism for providing secret data to QEMU in a
+secure manner, using the ``secret`` object type.
+
+At startup this can be done using the ``-object secret,...`` command line
+argument. At runtime this can be done using the ``object_add`` QMP / HMP
+monitor commands. The examples that follow will illustrate use of ``-object``
+command lines, but they all apply equivalentely in QMP / HMP. When creating
+a ``secret`` object it must be given a unique ID string. This ID is then
+used to identify the object when configuring the thing which need the data.
+
+
+INSECURE: Passing secrets as clear text inline
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+**The following should never be done in a production environment or on a
+multi-user host. Command line arguments are usually visible in the process
+listings and are often collected in log files by system monitoring agents
+or bug reporting tools. QMP/HMP commands and their arguments are also often
+logged and attached to bug reports. This all risks compromising secrets that
+are passed inline.**
+
+For the convenience of people debugging / developing with QEMU, it is possible
+to pass secret data inline on the command line.
+
+::
+
+   -object secret,id=secvnc0,data=87539319
+
+
+Again it is possible to provide the data in base64 encoded format, which is
+particularly useful if the data contains binary characters that would clash
+with argument parsing.
+
+::
+
+   -object secret,id=secvnc0,data=ODc1MzkzMTk=,format=base64
+
+
+**Note: base64 encoding does not provide any security benefit.**
+
+Passing secrets as clear text via a file
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The simplest approach to providing data securely is to use a file to store
+the secret:
+
+::
+
+   -object secret,id=secvnc0,file=vnc-password.txt
+
+
+In this example the file ``vnc-password.txt`` contains the plain text secret
+data. It is important to note that the contents of the file are treated as an
+opaque blob. The entire raw file contents is used as the value, thus it is
+important not to mistakenly add any trailing newline character in the file if
+this newline is not intended to be part of the secret data.
+
+In some cases it might be more convenient to pass the secret data in base64
+format and have QEMU decode to get the raw bytes before use:
+
+::
+
+   -object secret,id=sec0,file=vnc-password.txt,format=base64
+
+
+The file should generally be given mode ``0600`` or ``0400`` permissions, and
+have its user/group ownership set to the same account that the QEMU process
+will be launched under. If using mandatory access control such as SELinux, then
+the file should be labelled to only grant access to the specific QEMU process
+that needs access. This will prevent other processes/users from compromising the
+secret data.
+
+
+Passing secrets as cipher text inline
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+To address the insecurity of passing secrets inline as clear text, it is
+possible to configure a second secret as an AES key to use for decrypting
+the data.
+
+The secret used as the AES key must always be configured using the file based
+storage mechanism:
+
+::
+
+   -object secret,id=secmaster,file=masterkey.data,format=base64
+
+
+In this case the ``masterkey.data`` file would be initialized with 32
+cryptographically secure random bytes, which are then base64 encoded.
+The contents of this file will by used as an AES-256 key to encrypt the
+real secret that can now be safely passed to QEMU inline as cipher text
+
+::
+
+   -object secret,id=secvnc0,keyid=secmaster,data=BASE64-CIPHERTEXT,iv=BASE64-IV,format=base64
+
+
+In this example ``BASE64-CIPHERTEXT`` is the result of AES-256-CBC encrypting
+the secret with ``masterkey.data`` and then base64 encoding the ciphertext.
+The ``BASE64-IV`` data is 16 random bytes which have been base64 encrypted.
+These bytes are used as the initialization vector for the AES-256-CBC value.
+
+A single master key can be used to encrypt all subsequent secrets, **but it is
+critical that a different initialization vector is used for every secret**.
+
+Passing secrets via the Linux keyring
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The earlier mechanisms described are platform agnostic. If using QEMU on a Linux
+host, it is further possible to pass secrets to QEMU using the Linux keyring:
+
+::
+
+   -object secret_keyring,id=secvnc0,serial=1729
+
+
+This instructs QEMU to load data from the Linux keyring secret identified by
+the serial number ``1729``. It is possible to combine use of the keyring with
+other features mentioned earlier such as base64 encoding:
+
+::
+
+   -object secret_keyring,id=secvnc0,serial=1729,format=base64
+
+
+and also encryption with a master key:
+
+::
+
+   -object secret_keyring,id=secvnc0,keyid=secmaster,serial=1729,iv=BASE64-IV
+
+
+Best practice
+~~~~~~~~~~~~~
+
+It is recommended for production deployments to use a master key secret, and
+then pass all subsequent inline secrets encrypted with the master key.
+
+Each QEMU instance must have a distinct master key, and that must be generated
+from a cryptographically secure random data source. The master key should be
+deleted immediately upon QEMU shutdown. If passing the master key as a file,
+the key file must have access control rules applied that restrict access to
+just the one QEMU process that is intended to use it. Alternatively the Linux
+keyring can be used to pass the master key to QEMU.
+
+The secrets for individual QEMU device backends must all then be encrypted
+with this master key.
+
+This procedure helps ensure that the individual secrets for QEMU backends will
+not be compromised, even if ``-object`` CLI args or ``object_add`` monitor
+commands are collected in log files and attached to public bug support tickets.
+The only item that needs strongly protecting is the master key file.
-- 
2.31.1


