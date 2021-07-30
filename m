Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC023DBFB4
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 22:23:00 +0200 (CEST)
Received: from localhost ([::1]:36720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9Z23-0003nx-5K
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 16:22:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1m9Yyi-0005Qx-Je
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 16:19:32 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:42571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1m9Yyg-00013w-Gn
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 16:19:32 -0400
Received: by mail-pl1-x62e.google.com with SMTP id t3so10319107plg.9
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 13:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=JkZwuzQkkxI2CGB1gC7hFR0u0qV4Z/y/4b8e7xW4IJ0=;
 b=UuxIfdlYBD8LSP65f0xZCVb68Mpqw/y2yshbkDGQ7SEEW+1xVFxCU2yTxyTWo85EoS
 ue7LNZj6fx39TA73O/KJDecYaXgIhqs+bnRrPUzVHuzwkLbf1HNLw1jhvTucrI/yx8HP
 0pfbez4z+EAUn1Jbj3vY599j4qsYUp7Sb3gLXCTWODKki0OHzHE706MGOCTFpy4NgxpL
 IJOwMBpKOC8GWQ6vCfzgnD4+fnbA9KDPP3L4u+Wy7rw6OftmS6xvZnQVSD+f9Bkg+5T8
 KlZPCQBMB5d7RJcOtaCt2ZsSu9g0wnYtjoQmUt5Q+sJGnS86+6DNWegAAVLqc8hoThQf
 or/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=JkZwuzQkkxI2CGB1gC7hFR0u0qV4Z/y/4b8e7xW4IJ0=;
 b=Ii4Aafuz0DkOP6WcqOqcyOuScjPw5SDEqQPkdjkw6j+KOQt4S6RNMCveYqpBtKVAvN
 IGgov9KTw/1mWpGf/Rm/DosqlA4cPzCSs4+y3LSp5lxf1cVe5EG8a2dmYY7J/p4MJSk+
 HMWyAkfsW0gi3/gd7Dn33T7K5ev30OYKTUGbVrvNsUT+gc2qkFGRu6Qsk+RpsVmJUeoL
 BiNMHJdKJ21c2zzXT1C5ndLl0N7Wydxd9gTx0xDKWRZIS/pPv2J8MZmmF/dhGL9AJd8V
 wp9F03fUov2H7bvZ8SBPRqQ/eu8KLkgUogAUDc+TSCT2rB7Anyp3fNO2/s95PJY1cS4c
 bjXg==
X-Gm-Message-State: AOAM533tzP5F2acEu0zEiT947+uAJKiS8Eum6qlYIM+ZKGog+SvTaOLf
 H0BRqhRiMvTW+gHvyAcks91ch9TnWT8ydA==
X-Google-Smtp-Source: ABdhPJwFmiSofFANrO20vdJAICMB3f6Muxjtr58mYgJxqMV8LhSl9pGarJZGZ8I7KFQT1Nm+sgLGHw==
X-Received: by 2002:a62:1ac3:0:b029:3ae:d818:dfd with SMTP id
 a186-20020a621ac30000b02903aed8180dfdmr3932827pfa.43.1627676369021; 
 Fri, 30 Jul 2021 13:19:29 -0700 (PDT)
Received: from localhost.localdomain ([120.138.12.243])
 by smtp.gmail.com with ESMTPSA id s50sm3256842pfw.212.2021.07.30.13.19.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 13:19:28 -0700 (PDT)
From: G S Niteesh Babu <niteesh.gs@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/13] python/aqmp-tui: Add QMP connection manager
Date: Sat, 31 Jul 2021 01:48:42 +0530
Message-Id: <20210730201846.5147-10-niteesh.gs@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210730201846.5147-1-niteesh.gs@gmail.com>
References: <20210730201846.5147-1-niteesh.gs@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=niteesh.gs@gmail.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: ehabkost@redhat.com, kchamart@redhat.com, jsnow@redhat.com,
 armbru@redhat.com, wainersm@redhat.com,
 G S Niteesh Babu <niteesh.gs@gmail.com>, stefanha@redhat.com, crosa@redhat.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of manually connecting and disconnecting from the
server. We now rely on the runstate to manage the QMP
connection.

Along with this the ability to reconnect on certain exceptions
has also been added.

Signed-off-by: G S Niteesh Babu <niteesh.gs@gmail.com>
---
 python/qemu/aqmp/aqmp_tui.py | 109 ++++++++++++++++++++++++++++++-----
 1 file changed, 94 insertions(+), 15 deletions(-)

diff --git a/python/qemu/aqmp/aqmp_tui.py b/python/qemu/aqmp/aqmp_tui.py
index 0d5ec62cb7..ef91883fa5 100644
--- a/python/qemu/aqmp/aqmp_tui.py
+++ b/python/qemu/aqmp/aqmp_tui.py
@@ -25,8 +25,9 @@
 import urwid_readline
 
 from ..qmp import QEMUMonitorProtocol, QMPBadPortError
+from .error import ProtocolError
 from .message import DeserializationError, Message, UnexpectedTypeError
-from .protocol import ConnectError
+from .protocol import ConnectError, Runstate
 from .qmp_client import ExecInterruptedError, QMPClient
 from .util import create_task, pretty_traceback
 
@@ -67,12 +68,24 @@ def format_json(msg: str) -> str:
     return ' '.join(words)
 
 
+def type_name(mtype: Any) -> str:
+    """
+    Returns the type name
+    """
+    return type(mtype).__name__
+
+
 class App(QMPClient):
-    def __init__(self, address: Union[str, Tuple[str, int]]) -> None:
+    def __init__(self, address: Union[str, Tuple[str, int]], num_retries: int,
+                 retry_delay: Optional[int]) -> None:
         urwid.register_signal(type(self), UPDATE_MSG)
         self.window = Window(self)
         self.address = address
         self.aloop: Optional[Any] = None  # FIXME: Use more concrete type.
+        self.num_retries = num_retries
+        self.retry_delay = retry_delay
+        self.retry: bool = False
+        self.disconnecting: bool = False
         super().__init__()
 
     def add_to_history(self, msg: str, level: Optional[str] = None) -> None:
@@ -119,7 +132,7 @@ def _cb_inbound(self, msg: Message) -> Message:
             LOGGER.info('Error server disconnected before reply')
             urwid.emit_signal(self, UPDATE_MSG,
                               '{"error": "Server disconnected before reply"}')
-            self._set_status("Server disconnected")
+            await self.disconnect()
         except Exception as err:
             LOGGER.error('Exception from _send_to_server: %s', str(err))
             raise err
@@ -136,15 +149,29 @@ def kill_app(self) -> None:
         create_task(self._kill_app())
 
     async def _kill_app(self) -> None:
-        # It is ok to call disconnect even in disconnect state
+        await self.disconnect()
+        LOGGER.debug('Disconnect finished. Exiting app')
+        raise urwid.ExitMainLoop()
+
+    async def disconnect(self) -> None:
+        if self.disconnecting:
+            return
         try:
-            await self.disconnect()
-            LOGGER.debug('Disconnect finished. Exiting app')
+            self.disconnecting = True
+            await super().disconnect()
+            self.retry = True
+        except EOFError as err:
+            LOGGER.info('disconnect: %s', type_name(err))
+            self.retry = True
+        except ProtocolError as err:
+            LOGGER.info('disconnect: %s', type_name(err))
+            self.retry = False
         except Exception as err:
-            LOGGER.info('_kill_app: %s', str(err))
-            # Let the app crash after providing a proper stack trace
+            LOGGER.error('disconnect: Unhandled exception %s', str(err))
+            self.retry = False
             raise err
-        raise urwid.ExitMainLoop()
+        finally:
+            self.disconnecting = False
 
     def handle_event(self, event: Message) -> None:
         # FIXME: Consider all states present in qapi/run-state.json
@@ -161,14 +188,61 @@ def _get_formatted_address(self) -> str:
             addr = f'{host}:{port}'
         return addr
 
-    async def connect_server(self) -> None:
+    async def _retry_connection(self) -> Optional[str]:
+        current_retries = 0
+        err = None
+        # Increase in power sequence of 2 if no delay is provided
+        cur_delay = 1
+        inc_delay = 2
+        if self.retry_delay:
+            inc_delay = 1
+            cur_delay = self.retry_delay
+        # initial try
+        await self.connect_server()
+        while self.retry and current_retries < self.num_retries:
+            LOGGER.info('Connection Failed, retrying in %d', cur_delay)
+            status = f'[Retry #{current_retries} ({cur_delay}s)]'
+            self._set_status(status)
+
+            await asyncio.sleep(cur_delay)
+
+            err = await self.connect_server()
+            cur_delay *= inc_delay
+            # Cap delay to 5mins
+            cur_delay = min(cur_delay, 5 * 60)
+            current_retries += 1
+        # If all retries failed report the last error
+        LOGGER.info('All retries failed: %s', str(err))
+        return type_name(err)
+
+    async def manage_connection(self) -> None:
+        while True:
+            if self.runstate == Runstate.IDLE:
+                LOGGER.info('Trying to reconnect')
+                err = await self._retry_connection()
+                # If retry is still true then, we have exhausted all our tries.
+                if self.retry:
+                    self._set_status(f'Error: {err}')
+                else:
+                    addr = self._get_formatted_address()
+                    self._set_status(f'[Connected {addr}]')
+            elif self.runstate == Runstate.DISCONNECTING:
+                self._set_status('[Disconnected]')
+                await self.disconnect()
+                # check if a retry is needed
+                if self.runstate == Runstate.IDLE:
+                    continue
+            await self.runstate_changed()
+
+    async def connect_server(self) -> Optional[str]:
         try:
             await self.connect(self.address)
-            addr = self._get_formatted_address()
-            self._set_status(f'Connected to {addr}')
+            self.retry = False
         except ConnectError as err:
             LOGGER.info('connect_server: ConnectError %s', str(err))
-            self._set_status('Server shutdown')
+            self.retry = True
+            return type_name(err)
+        return None
 
     def run(self, debug: bool = False) -> None:
         screen = urwid.raw_display.Screen()
@@ -191,7 +265,7 @@ def run(self, debug: bool = False) -> None:
                                    event_loop=event_loop)
 
         create_task(self.wait_for_events(), self.aloop)
-        create_task(self.connect_server(), self.aloop)
+        create_task(self.manage_connection(), self.aloop)
         try:
             main_loop.run()
         except Exception as err:
@@ -333,6 +407,11 @@ def main() -> None:
     parser = argparse.ArgumentParser(description='AQMP TUI')
     parser.add_argument('qmp_server', help='Address of the QMP server'
                         '< UNIX socket path | TCP addr:port >')
+    parser.add_argument('--num-retries', type=int, default=10,
+                        help='Number of times to reconnect before giving up')
+    parser.add_argument('--retry-delay', type=int,
+                        help='Time(s) to wait before next retry.'
+                        'Default action is to increase delay in powers of 2')
     parser.add_argument('--log-file', help='The Log file name')
     parser.add_argument('--log-level', default='WARNING',
                         help='Log level <CRITICAL|ERROR|WARNING|INFO|DEBUG|>')
@@ -348,7 +427,7 @@ def main() -> None:
     except QMPBadPortError as err:
         parser.error(str(err))
 
-    app = App(address)
+    app = App(address, args.num_retries, args.retry_delay)
 
     if args.log_file:
         LOGGER.addHandler(logging.FileHandler(args.log_file))
-- 
2.17.1


